class ChangeColumnNameToAgency < ActiveRecord::Migration[7.0]
  def change
    remove_column :agencies, :type
    add_column :agencies, :agency_type, :string
  end
end
