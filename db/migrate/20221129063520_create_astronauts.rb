class CreateAstronauts < ActiveRecord::Migration[7.0]
  def change
    create_table :astronauts do |t|
      t.string :name
      t.string :status
      t.string :agency
      t.string :profile_image

      t.timestamps
    end
  end
end
