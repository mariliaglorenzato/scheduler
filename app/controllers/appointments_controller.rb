class AppointmentsController < ApplicationController
    def index
      @appointments = user.appointments
    end

    def show 
      @appointment = Appointment.find(params[:id])
    end

    def new
      @appointment = Appointment.new
      @appointment_guests_array = []
    end

    def edit
      @appointment = Appointment.find(params[:id])
      @appointment_guests = @appointment.appointment_guests
    end
    
    def create
      @appointment = user.appointments.create(params_to_create)
      if @appointment.errors[:end_date].present?
        flash[:alert] = "Final date should be greater than initial date time"
        render :new, status: 422 
      elsif @appointment.errors[:start_date].present?
        flash[:alert] =  "can't create appointment: another appointment conflicting between datetimes"
        render :new, status: 422 
      else
        @appointment_guests = create_appointment_guests!
        redirect_to appointments_path
      end
    end
    
    def update
      @appointment = Appointment.find(params[:id])
      if !@appointment.update!(params_to_update)
        flash[:alert] = "Final date should be greater than initial date time"
        render :show, status: 422
      else
        create_appointment_guests!
        @appointment_guests = @appointment.appointment_guests
        redirect_to appointments_path
      end
    end

    def destroy
      @appointment.destroy
    
      redirect_to appointments_path
    end 
  
    private
      def params_to_update
        params.require(:appointment).permit(
          :title, :description, :locale, :start_date, :end_date, :guest_emails
        )
      end
  
      def params_to_create
        params.require(:appointment).permit(:title, :description, :locale, :start_date, :end_date, :guest_emails)
      end

      def guest_email_list
        params[:guest_emails].compact
      end

      def user
        current_user
      end

      def create_appointment_guests!
        guest_email_list.map do |email|
          @appointment.appointment_guests.create!(email: email)
        end
      end
  end
  