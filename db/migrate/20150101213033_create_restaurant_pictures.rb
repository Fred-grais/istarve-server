class CreateRestaurantPictures < ActiveRecord::Migration
  def change
    create_table :restaurant_pictures do |t|
      t.integer :restaurant_id, null: false

      t.timestamps
    end
  end
end
