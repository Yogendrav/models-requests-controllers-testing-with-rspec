class AddIndexToCareersEmail < ActiveRecord::Migration
  def change
  	add_index :careers, :email, unique: true
  end
  
end
