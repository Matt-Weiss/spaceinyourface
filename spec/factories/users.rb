FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Movies::StarWars.specie }
    password { "password" }
    password_confirmation { "password"}
  end
end
