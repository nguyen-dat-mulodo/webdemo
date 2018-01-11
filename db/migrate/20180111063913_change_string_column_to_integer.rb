class ChangeStringColumnToInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :quantity, :integer, :default => 1
  end
end
