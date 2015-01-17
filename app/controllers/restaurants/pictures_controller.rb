module Restaurants
  class PicturesController < ApplicationController
    # :before_action :set_restaurant_picture, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :set_restaurant, only: [:create, :index]

    # GET /restaurant_pictures
    # GET /restaurant_pictures.json
    def index
      @restaurant_pictures = @restaurant.pictures
    end

    # POST /restaurant_pictures
    # POST /restaurant_pictures.json
    def create
      @restaurant_picture = @restaurant.pictures.new(image: params[:picture])

      respond_to do |format|
        if @restaurant_picture.save
          format.html { redirect_to @restaurant_picture, notice: 'Restaurant picture was successfully created.' }
          format.json { render json: {status: :success, event: :restaurant_picture_added}, status: :ok }
        else
          format.html { render :new }
          format.json { render json: @restaurant_picture.errors.messages, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /restaurant_pictures/1
    # DELETE /restaurant_pictures/1.json
    def destroy
      @restaurant_picture.destroy
      respond_to do |format|
        format.html { redirect_to restaurant_pictures_url, notice: 'Restaurant picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def restaurant_picture_params
        params.require(:restaurant_picture).permit(:restaurant_id)
      end
  end
end