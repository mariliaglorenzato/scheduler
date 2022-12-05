class UserContactGroup < ApplicationRecord
    belongs_to :user_contact
    belongs_to :group
end