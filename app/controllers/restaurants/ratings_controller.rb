
  class Restaurants::RatingsController < ApplicationController
    before_action :set_restaurant_rating, only: [:show, :edit, :update, :destroy]
    before_action :set_restaurant, only: [:index,:create, :update]
    before_action :authenticate_user!
    # GET /restaurant_ratings
    # GET /restaurant_ratings.json

    respond_to :json
    def index
      @restaurant_ratings = RestaurantRating.all
    end

    # GET /restaurant_ratings/1
    # GET /restaurant_ratings/1.json
    def show
    end

    # GET /restaurant_ratings/new
    def new
      @restaurant_rating = RestaurantRating.new
    end

    # GET /restaurant_ratings/1/edit
    def edit
    end

    # POST /restaurant_ratings
    # POST /restaurant_ratings.json
    def create
      rating_params = {rating: params[:rating], user_id: current_user.id}
      if @restaurant_rating = RestaurantRating.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
        success = @restaurant_rating.update(rating_params.except(:user_id))
      else
        @restaurant_rating = @restaurant.ratings.new(rating_params)
        success = @restaurant_rating.save
      end


      respond_to do |format|
        if success
          format.html { redirect_to @restaurant_rating, notice: 'Restaurant rating was successfully created.' }
          format.json { render json: {status: :success}, status: :ok }
        else
          format.html { render :new }
          format.json { render json: { errors: @restaurant_rating.errors }, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /restaurant_ratings/1
    # PATCH/PUT /restaurant_ratings/1.json
    def update
      respond_to do |format|
        if @restaurant_rating.update(restaurant_rating_params)
          format.html { redirect_to @restaurant_rating, notice: 'Restaurant rating was successfully updated.' }
          format.json { render json: {status: :success}, status: :ok}
        else
          format.html { render :edit }
          format.json { render json: { errors: @restaurant_rating.errors }, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /restaurant_ratings/1
    # DELETE /restaurant_ratings/1.json
    def destroy
      @restaurant_rating.destroy
      respond_to do |format|
        format.html { redirect_to restaurant_ratings_url, notice: 'Restaurant rating was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def user_rating
      @restaurant_rating = RestaurantRating.find_by(restaurant_id: params[:restaurant_id], user_id: current_user.id)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_restaurant_rating
        @restaurant_rating = RestaurantRating.find(params[:id])
      end

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

    # Never trust parameters from the scary internet, only allow the white list through.
      def restaurant_rating_params
        params.require(:restaurant_rating).permit(:rating).merge!(user_id: current_user.id)
      end
  end
