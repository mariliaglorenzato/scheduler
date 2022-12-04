class AppointmentGuest < ApplicationRecord
    belongs_to :appointment
    accepts_nested_attributes_for :appointment
end
