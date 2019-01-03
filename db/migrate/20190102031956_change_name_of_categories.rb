class ChangeNameOfCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :cat_name, :category_name
    rename_column :categories, :cat_content, :description
  end
end
