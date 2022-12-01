class UpdateRoleOnTopicMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :topic_members, :role, :string
    add_column :topic_members, :role, :integer, default: 0
  end
end
