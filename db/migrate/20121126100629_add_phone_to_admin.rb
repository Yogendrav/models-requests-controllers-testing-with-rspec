class AddPhoneToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :phone, :integer
  end
end
