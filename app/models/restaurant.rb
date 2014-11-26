class Restaurant < ActiveRecord::Base

  validates :name, :address, :type_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: [:address, :name]

  belongs_to :type, class_name: 'RestaurantType'
  belongs_to :user
end
