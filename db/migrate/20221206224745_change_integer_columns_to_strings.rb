class ChangeIntegerColumnsToStrings < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :newsSite, :string
    change_column :articles, :summary, :string
    change_column :articles, :publishedAt, :string
  end
end
