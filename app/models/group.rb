class Group < ApplicationRecord    
    has_many :user_contact_groups
    has_many :user_contacts, :through => :user_contact_groups
end