FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Movies::StarWars.specie }
  end
end
