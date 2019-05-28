class AddImageUrlToCelestialBodies < ActiveRecord::Migration[5.2]
  def change
    add_column :celestial_bodies, :image_url, :string
  end
end
