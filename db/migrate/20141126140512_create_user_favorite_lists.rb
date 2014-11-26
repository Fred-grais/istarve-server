class CreateUserFavoriteLists < ActiveRecord::Migration
  def change
    create_table :user_favorite_lists do |t|
      t.integer :user_id, null: false
      t.integer :restaurant_id, null: false

      t.timestamps
    end
    add_index :user_favorite_lists, [:user_id, :restaurant_id], unique: true
  end
end
