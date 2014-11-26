class CreateRestaurantRatings < ActiveRecord::Migration
  def change
    create_table :restaurant_ratings do |t|
      t.integer :rating, null: false
      t.integer :restaurant_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :restaurant_ratings, [:restaurant_id, :user_id], unique: true
  end
end
