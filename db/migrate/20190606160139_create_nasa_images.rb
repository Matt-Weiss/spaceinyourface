class CreateNasaImages < ActiveRecord::Migration[5.2]
  def change
    create_table :nasa_images do |t|
      t.string :hdurl

      t.timestamps
    end
  end
end
