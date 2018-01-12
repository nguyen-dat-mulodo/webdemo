class RenameAuthorColumnToQuantity < ActiveRecord::Migration[5.1]
  def change
  	rename_column :posts, :author, :quantity
  end
end
