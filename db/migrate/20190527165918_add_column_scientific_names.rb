class AddColumnScientificNames < ActiveRecord::Migration[5.2]
  def change
    add_column :celestial_bodies, :scientific_name, :string
  end
end
