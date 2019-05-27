class AddDescriptionToCelestialBodies < ActiveRecord::Migration[5.2]
  def change
    add_column :celestial_bodies, :description, :text
  end
end
