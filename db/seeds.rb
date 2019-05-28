# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
User.destroy_all
user1 = User.create(user_name: 'User 1', email: 'user1@gmail.com', password: 'password')


# CelestialBodies
CelestialBodies.destroy_all

moon = CelestialBodies.create(name: "Luna")
mercury = CelestialBodies.create(name: "Mercury")
venus= CelestialBodies.create(name: "Venus")
mars = CelestialBodies.create(name: "Mars")
jupiter = CelestialBodies.create(name: "Jupiter")
saturn= CelestialBodies.create(name: "Saturn")
uranus = CelestialBodies.create(name: "Uranus")
neptune = CelestialBodies.create(name: "Neptune")
pluto = CelestialBodies.create(name: "Pluto")
