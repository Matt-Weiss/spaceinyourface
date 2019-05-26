class DropZipCodes < ActiveRecord::Migration[5.2]
  def change
    drop_table(:zip_codes)
  end
end
