class CreateUserContactGroups < ActiveRecord::Migration[7.0]
    def change
      create_table :user_contact_groups do |t|  
        t.integer :user_contact_id, :null => false
        t.integer :contact_group_id, :null => false
        t.timestamps
      end
    end
  end
  