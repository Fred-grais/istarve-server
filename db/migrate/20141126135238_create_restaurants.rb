class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.float :lat
      t.float :lon
      t.integer :type_id, null: false

      t.timestamps
    end
    add_index :restaurants, [:user_id, :name, :address], unique: true
  end
end
