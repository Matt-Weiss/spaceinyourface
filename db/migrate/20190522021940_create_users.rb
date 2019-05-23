class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :user_name
      t.string  :password_digest
      t.integer :google_token, default: nil

      t.timestamps
    end
  end
end
