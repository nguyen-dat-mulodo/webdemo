class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.integer :room_user

      t.timestamps
    end
  end
end
