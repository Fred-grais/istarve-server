class UserFavoriteList < ActiveRecord::Base

  validates :restaurant_id, :user_id, presence: true
  validates_uniqueness_of :restaurant_id, scope: :user_id

  belongs_to :user
  belongs_to :restaurant
end
