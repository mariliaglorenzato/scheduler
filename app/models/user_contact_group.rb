class UserContactGroup < ApplicationRecord

    attr_accessor :user_contact_id, :group_id

    belongs_to :user_contact
    belongs_to :group
end