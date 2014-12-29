class Restaurants::CommentsController < ApplicationController
  before_action :set_restaurant_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:index, :create, :update]

  before_action :authenticate_user!
  # GET /restaurant_comments
  # GET /restaurant_comments.json

  respond_to :json

  def index
    @restaurant_comments = @restaurant.comments.order('updated_at DESC')
  end

  # GET /restaurant_comments/1
  # GET /restaurant_comments/1.json
  def show
  end

  # GET /restaurant_comments/new
  def new
    @restaurant_comment = RestaurantComment.new
  end

  # GET /restaurant_comments/1/edit
  def edit
  end

  # POST /restaurant_comments
  # POST /restaurant_comments.json
  def create
    comment_params =  {title: params[:title], body: params[:body], user_id: current_user.id}

    if @restaurant_comment = RestaurantComment.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
      success = @restaurant_comment.update(comment_params.except(:user_id))
      event = :comment_updated
    else
      @restaurant_comment = @restaurant.comments.new(comment_params)
      success = @restaurant_comment.save
      event = :comment_created
    end
    respond_to do |format|
      if success
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully created.' }
        format.json { render json: {status: :success, event: event}, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_comments/1
  # PATCH/PUT /restaurant_comments/1.json
  def update
    respond_to do |format|
      if @restaurant_comment.update(restaurant_comment_params)
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully updated.' }
        format.json { render json: {status: :success}, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_comments/1
  # DELETE /restaurant_comments/1.json
  def destroy
    @restaurant_comment.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_comments_url, notice: 'Restaurant comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_comment
    @restaurant_comment = RestaurantComment.find_by(restaurant_id: params[:restaurant_id], user_id: current_user.id)
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_comment
      @restaurant_comment = RestaurantComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_comment_params
      params.require(:restaurant_comment).permit(:title, :body).merge!(user_id: current_user.id)
    end
end
