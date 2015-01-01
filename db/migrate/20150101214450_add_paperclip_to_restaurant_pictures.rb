class AddPaperclipToRestaurantPictures < ActiveRecord::Migration
  def self.up
    add_attachment :restaurant_pictures, :image
  end

  def self.down
    remove_attachment :restaurant_pictures, :image
  end
end
