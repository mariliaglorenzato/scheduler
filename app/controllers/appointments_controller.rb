class AppointmentsController < ApplicationController
    def index
      @appointments = user.appointments
    end

    def show 
      @appointment = Appointment.find(params[:id])
    end

    def new
      @appointment = Appointment.new
      @appointment_guests_list = user.user_contacts.all     
    end

    def edit
      @appointment = Appointment.find(params[:id])
    end
    
    def create
      @appointment = user.appointments.create(params_to_create)
      
      if @appointment.errors[:end_date].present?
        flash[:alert] = "Data final anterior a data inicial"
        render :new, status: 422 
      else
        redirect_to appointments_path
      end
      
    end
    def update
      @appointment = Appointment.find(params[:id])
      if !@appointment.update!(params_to_update)
        render :show, status: 422, alert: "Data final anterior a data inicial"
      else
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
          :title, :description, :locale, :start_date, :end_date
        )
      end
  
      def params_to_create
        params.require(:appointment).permit(
          :title, :description, :locale, :start_date, :end_date
        )
      end

      def user
        current_user
      end
  end
  