class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email,              null: false, default: ""
      t.timestamps
    end
  end
end
