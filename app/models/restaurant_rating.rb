class RestaurantRating < ActiveRecord::Base

  validates :rating, :restaurant_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :restaurant_id

  belongs_to :user
  belongs_to :restaurant

  def user_identity
    user.pseudo
  end
end
