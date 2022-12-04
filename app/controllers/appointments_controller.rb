class AppointmentsController < ApplicationController
    def index
      @appointments = user.appointments
    end

    def show 
      @appointment = Appointment.find(params[:id])
    end

    def new
      @appointment = Appointment.new
    end

    def edit
      @appointment = Appointment.find(params[:id])
    end

    def create
      @appointment = user.appointments.create(params_to_create)
      
      if @appointment.save
        redirect_to appointments_path
      else
        render "new", @appointment.errors
      end
    end
  
    def update
      @appointment = Appointment.find(params[:id])
      @appointment.update!(params_to_update)

      redirect_to appointments_path
    end

    def destroy
      @appointment.destroy
    
      redirect_to appointments_path
    end 
  
    private
      def params_to_update
        params.require(:appointment).permit(
          :title, :description, :locale, :start_date, :end_date, appointment_guests_attributes: [:email]
        )
      end
  
      def params_to_create
        params.require(:appointment).permit(
          :title, :description, :locale, :start_date, :end_date, appointment_guests_attributes: [:email]
        )
      end

      def user
        current_user
      end
  end
  