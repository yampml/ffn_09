# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar", role: :admin,
  address: "Da Nang"

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email,
    password: password, password_confirmation: password,
    address: "Ha Noi #{n+1}"
end

5.times do |n|
  name = Faker::Name.name
  Continent.create! name: name
end

10.times do |n|
  name = Faker::Name.name
  Country.create! name: name, continent_id: 1
end

30.times do |n|
  name = Faker::Name.name
  city = "city #{n+1}"
  coach = "coach #{n+1}"
  president = "president #{n+1}"
  stadium = "stadium #{n+1}}"
  description = Faker::Lorem.sentence 3
  Team.create! name: name, stadium: stadium, city: city, coach: coach,
    president: president, description: description
end
