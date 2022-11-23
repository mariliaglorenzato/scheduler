class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])

    response_to do |format|

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render "error"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update!(params_to_update)
  end

  private
    def params_to_update
      params.require(:user).permit(:name, :email, :birth_date, :address, :streetNumber, :phone)
    end
end
