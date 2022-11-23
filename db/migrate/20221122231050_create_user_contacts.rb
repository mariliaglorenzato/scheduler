class CreateUserContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contacts do |t|
      t.bigint :contact_id
      t.bigint :owner_id

      t.timestamps
    end
  end
end
