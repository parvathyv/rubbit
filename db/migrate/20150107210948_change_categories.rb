class ChangeCategories < ActiveRecord::Migration
  def change
    change_column :articles, :category_id, :integer, null: false
    
  end
end
