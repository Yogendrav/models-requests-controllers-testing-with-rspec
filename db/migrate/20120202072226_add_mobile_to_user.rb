class AddMobileToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :text
  end
end
