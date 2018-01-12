class RemoveSlugFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :slug, :string
  end
end
