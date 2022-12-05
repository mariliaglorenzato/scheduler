class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      redirect_to home_path, status: 422, alert: @user.errors.message
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(params_to_update)
  end

  private
    def params_to_update
      params.require(:user).permit(:first_name, :last_name, :email, :birth_date, :address, :street_number, :phone_number)
    end
end
