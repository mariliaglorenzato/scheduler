class UserContactsController < ApplicationController
    def index
      @user_contacts = user.user_contacts
    end

    def show 
      @user_contact = UserContact.find(params[:id])
    end

    def new
      @user_contact = UserContact.new
      @group_list = ContactGroup.all
      @user_contact_groups = @user_contact.user_contact_groups.new
    end

    def edit
      @user_contact = UserContact.find(params[:id])
    end

    def create
      @user_contact = user.user_contacts.create(params_to_create)
      if @user_contact
        create_user_contact_groups
        redirect_to user_contacts_path
      else
        render "new", @user_contact.errors
      end
    end
  
    def update
      @user_contact = UserContact.find(params[:id])
      if @user_contact.update!(params_to_update)
        update_user_contact_groups
        redirect_to user_contacts_path
      else
        render "edit", @user_contact.errors
      end
    end

    def destroy
      @user_contact = UserContact.find(params[:id])
      @user_contact.destroy
    
      redirect_to user_contacts_path
    end
      
    private
      def params_to_update
        params.require(:user_contact).permit(:name, :email, :birth_date, user_contact_group: [:contact_group_id] )
      end
  
      def params_to_create
        params.require(:user_contact).permit(:name, :email, :birth_date, user_contact_group: [:contact_group_id])
      end

      def user_contact_groups_params
        params[:user_contact_group][:contact_group_id]
      end

      def user
        current_user
      end

      def create_user_contact_groups
        user_contact_groups_params.map do |contact_group_id|
          UserContactGroup.create({ user_contact_id: @user_contact.id, contact_group_id: contact_group_id })
        end
      end

      def update_user_contact_groups
        UserContactGroup.where(user_contact_id: @user_contact.id).destroy_all

        create_user_contact_groups
      end
  end
  