class CreateRestaurantComments < ActiveRecord::Migration
  def change
    create_table :restaurant_comments do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :restaurant_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :restaurant_comments, [:restaurant_id, :user_id], unique: true
  end
end
