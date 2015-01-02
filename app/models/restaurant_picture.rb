class RestaurantPicture < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :small => "100x100>" }, :default_url => "missing_picture.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :restaurant_id, presence: true

  belongs_to :restaurant
end
