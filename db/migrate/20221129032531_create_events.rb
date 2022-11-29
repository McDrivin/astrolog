class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :news_url
      t.string :video_url
      t.string :feature_image
      t.datetime :date
      t.string :type

      t.timestamps
    end
  end
end
