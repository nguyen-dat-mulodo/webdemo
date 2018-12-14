class ChangeProductImageAttachment < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :image_url
    add_attachment :products, :image, after: :description
  end
end
