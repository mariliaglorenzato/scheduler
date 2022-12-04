class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :taxpayer_registry, null: false, unique: true
      t.datetime :birth_date
      t.string :address
      t.string :street_number
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :encrypted_password, null: false

      t.timestamps
    end
  end
end
