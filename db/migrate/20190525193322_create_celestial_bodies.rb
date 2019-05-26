class CreateCelestialBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :celestial_bodies do |t|
      t.string :name
    end
  end
end
