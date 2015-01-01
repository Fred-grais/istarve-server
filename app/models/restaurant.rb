class Restaurant < ActiveRecord::Base

  validates :name, :address, :type_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: [:address, :name]

  belongs_to :type, class_name: 'RestaurantType'
  belongs_to :user

  has_many :ratings, class_name: 'RestaurantRating'
  has_many :comments, class_name: 'RestaurantComment'

  has_many :pictures, class_name: 'RestaurantPicture'


  def ratings_average
    self.ratings.average(:rating).to_i
  end
end
