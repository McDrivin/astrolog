class CreateAgencies < ActiveRecord::Migration[7.0]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :type
      t.string :country_code
      t.text :description
      t.string :founding_year
      t.string :spacecraft
      t.string :image_url
      t.string :logo_url

      t.timestamps
    end
  end
end
