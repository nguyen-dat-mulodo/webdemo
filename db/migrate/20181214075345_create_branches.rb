class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.attachment :image
      t.integer :publish

      t.timestamps
    end
  end
end
