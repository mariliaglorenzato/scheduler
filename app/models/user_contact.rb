class UserContact < ApplicationRecord
    belongs_to :user
    
    has_many :user_contact_groups
    has_many :groups, :through => :user_contact_groups

    def user_contact_groups_attributes=(user_contact_groups_attributes)
        user_contact_groups_attributes.map do |index, hash|
            UserContactGroup.find_or_create_by(user_contact: self, group_id: hash["id"])
        end  
    end

end
