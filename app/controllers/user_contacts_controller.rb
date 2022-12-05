class UserContactsController < ApplicationController
    def index
      @user_contacts = user.user_contacts
    end

    def show 
      @user_contact = UserContact.find(params[:id])
    end

    def new
      @user_contact = UserContact.new
      @group_list = Group.all
      @user_contact_groups = @user_contact.user_contact_groups.build
    end

    def edit
      @user_contact = UserContact.find(params[:id])
    end

    def create
      @user_contact = user.user_contacts.create(params_to_create)
      if @user_contact.save
        redirect_to user_contacts_path
      else
        render "new", @user_contact.errors
      end
    end
  
    def update
      @user_contact = UserContact.find(params[:id])
      @user_contact.update!(params_to_update)
    
      redirect_to user_contacts_path
    end

    def destroy
      @user_contact = UserContact.find(params[:id])
      @user_contact.destroy
    
      redirect_to user_contacts_path
    end 
  
    private
      def params_to_update
        params.require(:user_contact).permit(:name, :email, :birth_date, user_contact_groups: [:group_ids] )
      end
  
      def params_to_create
        params.require(:user_contact).permit(:name, :email, :birth_date, user_contact_groups: [:group_ids])
      end

      def user_contact_group_param
        params.require(:user_contact_groups).permit(:group_ids)
      end

      def user
        current_user
      end
  end
  