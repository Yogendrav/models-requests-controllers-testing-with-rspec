class AddPhotoToDMeal < ActiveRecord::Migration
  def change
    add_column :d_meals, :photo_file_name,    :string
    add_column :d_meals, :photo_content_type, :string
    add_column :d_meals, :photo_file_size,    :integer
    add_column :d_meals, :photo_updated_at,   :datetime
  end
end
