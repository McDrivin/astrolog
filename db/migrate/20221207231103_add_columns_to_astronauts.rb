class AddColumnsToAstronauts < ActiveRecord::Migration[7.0]
  def change
    add_column :astronauts, :age, :integer
    add_column :astronauts, :date_of_birth, :string
    add_column :astronauts, :date_of_death, :string
    add_column :astronauts, :nationality, :string
    add_column :astronauts, :twitter, :string
    add_column :astronauts, :instagram, :string
    add_column :astronauts, :bio, :string
    add_column :astronauts, :wiki, :string
  end
end
