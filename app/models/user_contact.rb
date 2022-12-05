class UserContact < ApplicationRecord
    belongs_to :user
    
    has_many :user_contact_groups
    has_many :groups, :through => :user_contact_groups
end
