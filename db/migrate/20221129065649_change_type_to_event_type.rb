class ChangeTypeToEventType < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :type, :event_type
  end
end
