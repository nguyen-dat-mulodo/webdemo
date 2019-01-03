class ChangeGenderOfCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :gender
    add_column :categories, :gender, :integer, after: :description
  end
end
