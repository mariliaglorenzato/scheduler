class UserContact < ApplicationRecord
    belongs_to :user
    
    has_many :user_contact_groups
    has_many :contact_groups, :through => :user_contact_groups

    def group_name_list
        self.user_contact_groups.map { |g| ContactGroup.find(g.contact_group_id).name }
    end
end
