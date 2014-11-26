class RestaurantType < ActiveRecord::Base

  validates :title, presence: true

  has_many :restaurants
end
