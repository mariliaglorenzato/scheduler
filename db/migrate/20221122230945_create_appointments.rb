class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true
     
      t.string :title
      t.text :description
      t.string :locale
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end
end
