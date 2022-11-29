class CreateLaunches < ActiveRecord::Migration[7.0]
  def change
    create_table :launches do |t|
      t.string :name
      t.string :status
      t.string :status_desc
      t.datetime :window_start
      t.datetime :window_end
      t.decimal :probability
      t.string :agenc
      t.string :rocket
      t.string :mission
      t.string :mission_desc
      t.string :pad
      t.string :pad_lat
      t.string :pad_lng
      t.string :pad_location

      t.timestamps
    end
  end
end
