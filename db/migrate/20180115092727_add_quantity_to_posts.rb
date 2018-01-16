class AddQuantityToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :quantity, :integer
  end
end
