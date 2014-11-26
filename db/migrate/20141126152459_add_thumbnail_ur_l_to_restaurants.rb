class AddThumbnailUrLToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :thumbnail_img_url, :string
  end
end
