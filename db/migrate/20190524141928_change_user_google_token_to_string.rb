class ChangeUserGoogleTokenToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :google_token, :string
  end
end
