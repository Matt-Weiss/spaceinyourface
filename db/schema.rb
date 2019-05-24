ActiveRecord::Schema.define(version: 2019_05_24_141928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "user_name"
    t.string "password_digest"
    t.string "google_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
