class CreateRestaurantTypes < ActiveRecord::Migration
  def change
    create_table :restaurant_types do |t|
      t.string :title, null: false, unique: true

      t.timestamps
    end
  end
end
