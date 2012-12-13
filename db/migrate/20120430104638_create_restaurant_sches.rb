class CreateRestaurantSches < ActiveRecord::Migration
  def change
    create_table :restaurant_sches do |t|
      t.integer :res_id
      t.integer :quantity
      t.integer :dish_id
      t.integer :status
      t.datetime :date
      t.timestamps
    end
  end
  # def change1
  #   add_column :restaurant_sches, :date, :datetime
  #   add_column :restaurant_sches, :status, :integer
  #   add_column :restaurant_sches, :quantity, :integer
  #   add_column :restaurant_sches, :dish_id, :integer
  # end
end
