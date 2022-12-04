class CreateAppointmentGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_guests do |t|
      t.belongs_to :appointment, index: true
      t.string :email, null: false
      t.string :phone_number
      t.timestamps
    end
  end
end
