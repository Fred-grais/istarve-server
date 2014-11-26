class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  before_create :skip_confirmation!

  has_many :restaurant_ratings
  has_many :restaurant_comments
  has_many :restaurants
  has_many :favorite_restaurants_assoc, class_name: 'UserFavoriteList'
  has_many :favorite_restaurants, through: :favorite_restaurants_assoc, source: :restaurant
end
