class CreateTopicMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :topic_members do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
