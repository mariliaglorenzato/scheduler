class CreateUserContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contacts do |t|
      t.belongs_to :user, index: true

      t.string :email, null: false, unique: true
      t.string :phone_number
      t.string :name, null: false
      t.datetime :birth_date
      t.timestamps
    end
  end
end
