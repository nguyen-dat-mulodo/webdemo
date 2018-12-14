class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.attachment :banner_event
      t.integer :number_of_participants
      t.references :user, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.text :price_ticket
      t.text :description

      t.timestamps
    end
  end
end
