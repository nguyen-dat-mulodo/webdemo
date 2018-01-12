class RenameAlbumsToPosts < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :albums, :posts
  end

  def self.down
    rename_table :posts, :albums
  end
end
