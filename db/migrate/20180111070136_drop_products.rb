class DropProducts < ActiveRecord::Migration[5.1]
  def change
  	drop_table :products do |t|
  		t.string :title
  		t.text :content
  		t.integer :quantity
  		t.timestamps
  	end
  end
end
