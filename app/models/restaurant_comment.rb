class RestaurantComment < ActiveRecord::Base

  validates :title, :body, :restaurant_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :restaurant_id

  belongs_to :user
  belongs_to :restaurant

  def user_identity
    user.email
  end

  def displayed_date
    self.updated_at.localtime.strftime("%F %T")
  end
end
