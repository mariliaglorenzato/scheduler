class AddInitialContactGroups < ActiveRecord::Migration[7.0]
  def up
    ContactGroup.create(name: "personal")
    ContactGroup.create(name: "professional")
    ContactGroup.create(name: "academic")
    ContactGroup.create(name: "others")
  end

  def down
    ContactGroup.all.delete
  end
end