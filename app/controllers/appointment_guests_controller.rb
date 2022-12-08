class AppointmentGuestsController < ApplicationController
  def destroy
    @appointment_guest = AppointmentGuest.find(params[:id])
    @appointment_guest.destroy
    redirect_to edit_appointment_path
  end
  
  def create
    destroy
  end
end
  