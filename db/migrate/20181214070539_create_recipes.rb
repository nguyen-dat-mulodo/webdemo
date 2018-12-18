class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.attachment :image
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
