class RenamePostsToProducts < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :posts, :products
  end

  def self.down
    rename_table :products, :posts
  end
end
