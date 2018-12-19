class AddTypeToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :type, :integer, after: :price
  end
end
