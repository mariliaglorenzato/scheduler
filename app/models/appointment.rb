class Appointment < ApplicationRecord
    belongs_to :user
    has_many :appointment_guests
    accepts_nested_attributes_for :appointment_guests, allow_destroy: true

    validates :end_date, comparison: { greater_than: :start_date}

    validate :can_schedule?

    attr_accessor :guest_emails

    scope :from_now, -> { where("start_date > ? ", DateTime.current.beginning_of_day) }

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

    def can_schedule?
        covered = false
        user.appointments.from_now.find_each do |appointment|
            puts appointment
            while covered == false do
                covered = (appointment.start_date..appointment.end_date).cover?(start_date) || 
                (appointment.start_date..appointment.end_date).cover?(end_date)
            end
        end

        if covered
            errors.add(:start_date, "can't create appointment: another appointment conflicting between datetimes")
        else
            true
        end
    end
end
