class DeleteLocationFromLaunches < ActiveRecord::Migration[7.0]
  def change
    remove_column :launches, :pad_location
  end
end
