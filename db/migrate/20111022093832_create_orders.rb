class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :meal_id
      t.integer :status
      t.integer :amount
      t.text :extra_info

      t.timestamps
    end
  end
end
