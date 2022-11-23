class CreateAppointmentGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_guests do |t|
      t.bigint :appointment_id
      t.bigint :user_contact_id

      t.timestamps
    end
  end
end
