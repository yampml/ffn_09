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

list_continents = ["Africa", "Asia", "Europe", "North America", "South America", "Australia"]
list_continents.each do |name|
  Continent.create! name: name
end

list_countries = ["Germany", "Brazil", "Belgium", "Portugal", "Argentina",
  "France", "Poland", "Chile", "Spain", "Peru", "Denmark", "England", "Uruguay",
  "Mexico", "Colombia", "Italy"]
list_countries.each do |name|
  Country.create! name: name, continent_id: 1+rand(6)
end

30.times do |n|
  name = Faker::Name.name
  city = Faker::Address.city
  coach = "coach #{n+1}"
  president = "president #{n+1}"
  stadium = "stadium #{n+1}}"
  description = Faker::Lorem.sentence 6
  Team.create! name: name, stadium: stadium, city: city, coach: coach,
    president: president, description: description,
    remote_picture_url: "https://jamesproctor28blog.files.wordpress.com/2015/06/barca-2015.jpg",
    remote_logo_url: "https://www.seeklogo.net/wp-content/uploads/2014/07/fc-barcelona-logo.png"
end

20.times do |n|
  name = Faker::Name.name
  dob = Faker::Date.birthday
  position = Faker::Lorem.word
  p_number = 1+rand(99)
  country_id = 1+rand(16)
  team_id = 1+rand(30)
  Player.create! name: name, dob: dob, position: position, p_number: p_number,
    country_id: country_id, team_id: team_id,
    remote_picture_url: "https://images.vov.vn/h500/uploaded/frf8b6lqiprwhdtzaag/2018_01_17/8_OREP.jpg"
end
