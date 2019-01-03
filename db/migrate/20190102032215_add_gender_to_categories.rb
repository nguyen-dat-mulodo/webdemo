class AddGenderToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :gender, :text, after: :description
  end
end
