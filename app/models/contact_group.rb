class ContactGroup < ApplicationRecord    
    has_many :user_contact_groups
    has_many :user_contacts, :through => :user_contact_groups

    def id_as_string
        id.to_s
    end

end