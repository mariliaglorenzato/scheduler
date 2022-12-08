class UserContactGroupsController < ApplicationController
    def index
      @contact_groups = ContactGroup.all 
      @user_contacts = user.user_contacts
      filtered_user_contacts if user_contact_group_id.present?
    end
      
    private

      def user
        current_user
      end

      def user_contact_group_id
        params[:user_contact_group]
      end
      
      def filtered_user_contacts
        @user_contacts = @user_contacts.joins(:user_contact_groups)
          .where(user_contact_groups: { contact_group_id: user_contact_group_id }).all       
      end
  end
  