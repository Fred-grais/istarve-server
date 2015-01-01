module Restaurants
  class UserFavoritesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_restaurant, only: [:manage]

      respond_to :json

      def manage
        if @favorite_list_entry = UserFavoriteList.find_by(user_id: current_user.id, restaurant_id: @restaurant.id)
          success = @favorite_list_entry.destroy
          event = :removed_favorite_list
        else
          @favorite_list_entry = UserFavoriteList.new(restaurant_id: @restaurant.id, user_id: current_user.id)
          success = @favorite_list_entry.save
          event = :added_favorite_list
        end

        respond_to do |format|
          if success
            format.html { redirect_to @restaurant_rating, notice: 'Restaurant rating was successfully created.' }
            format.json { render json: {status: :success, event: event}, status: :ok }
          else
            format.html { render :new }
            format.json { render json: { errors: @restaurant_rating.errors }, status: :unprocessable_entity }
          end
        end
      end

      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
      end
  end
end