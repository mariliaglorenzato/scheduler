class Appointment < ApplicationRecord
    belongs_to :user
    has_many :appointment_guests
    accepts_nested_attributes_for :appointment_guests, allow_destroy: true

    def appointment_guests_attributes=(appointment_guests_attributes)
        appointment_guests_attributes.map do |index, hash|
            AppointmentGuest.find_or_create_by(appointment: self, email: hash["email"])
        end  
    end

    def start_time
        self.start_date
    end

    def end_time
        self.end_date
    end
end
