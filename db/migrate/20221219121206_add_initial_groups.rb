class AddInitialGroups < ActiveRecord::Migration[7.0]
  def up
    Group.create(name: "personal")
    Group.create(name: "professional")
    Group.create(name: "academic")
    Group.create(name: "others")
  end

  def down
    Group.all.delete
  end
end