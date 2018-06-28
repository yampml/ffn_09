User.create! name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar", role: :admin,
  address: "Da Nang"

10.times do |n|
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

2.times do |n|
  name = "League #{n+1}"
  country_id = n+1
  League.create! name: name, country_id: country_id
end

24.times do |n|
  name = Faker::University.name
  city = Faker::Address.city
  coach = "coach #{n+1}"
  president = "president #{n+1}"
  stadium = "stadium #{n+1}}"
  description = Faker::Lorem.sentence 6
  Team.create! name: name, stadium: stadium, city: city, coach: coach,
    president: president, description: description, country_id: 1+rand(15),
    remote_picture_url: "https://jamesproctor28blog.files.wordpress.com/2015/06/barca-2015.jpg",
    remote_logo_url: "https://www.seeklogo.net/wp-content/uploads/2014/07/fc-barcelona-logo.png"
end

50.times do |n|
  name = Faker::Superhero.name
  dob = Faker::Date.birthday
  position = Faker::Lorem.word
  p_number = 1+rand(99)
  country_id = 1+rand(16)
  team_id = 1+rand(23)
  Player.create! name: name, dob: dob, position: position, p_number: p_number,
    country_id: country_id, team_id: team_id,
    remote_picture_url: "https://images.vov.vn/h500/uploaded/frf8b6lqiprwhdtzaag/2018_01_17/8_OREP.jpg"
end

30.times do |n|
  LeagueTeamJoinModel.create! team_id: 1+rand(24), league_id: 1+rand(2)
end

20.times do |n|
  name = Faker::DragonBall.character
  received_day = Faker::Date.between(2.year.ago, Date.today)
  team_id = 1+rand(23)
  Achievement.create! name: name, received_day: received_day, team_id: team_id,
    remote_picture_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdA_dcVmE2RHi6rgHYb9fo2cCcWMSDHsksursN1tRNoAb_-GZS9A"
end

ids_team_league1 = LeagueTeamJoinModel.all.map { |x| x.team_id }.to_set.to_a
ids_team_league2 = LeagueTeamJoinModel.all.map { |x| x.team_id }.to_set.to_a

10.times do |n|
  lucky_number = ids_team_league1.shuffle.take 2
  team1_id = lucky_number[0]
  team2_id = lucky_number[1]
  score1 = rand(7)
  score2 = rand(7)
  day = Faker::Date.between(1.year.ago, Date.today)
  time = Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%H:%M")
  stadium = "Stadium #{n+1}"
  Match.create! team1_id: team1_id, team2_id: team2_id, score1: score1, score2: score2,
    day: day, start_time: time, stadium: stadium, league_id: 1

  lucky_number = ids_team_league1.shuffle.take 2
  team1_id = lucky_number[0]
  team2_id = lucky_number[1]
  day = Faker::Date.between(Date.today, Date.today + 100)
  time = Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%H:%M")
  Match.create! team1_id: team1_id, team2_id: team2_id,
    day: day, start_time: time, stadium: stadium, league_id: 1

  lucky_number = ids_team_league2.shuffle.take 2
  team1_id = lucky_number[0]
  team2_id = lucky_number[1]
  score1 = rand(7)
  score2 = rand(7)
  day = Faker::Date.between(1.year.ago, Date.today)
  time = Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%H:%M")
  Match.create! team1_id: team1_id, team2_id: team2_id, score1: score1, score2: score2,
    day: day, start_time: time, stadium: stadium, league_id: 2

  lucky_number = ids_team_league2.shuffle.take 2
  team1_id = lucky_number[0]
  team2_id = lucky_number[1]
  day = Faker::Date.between(Date.today, Date.today + 100)
  time = Faker::Time.between(DateTime.now - 1, DateTime.now).strftime("%H:%M")
  Match.create! team1_id: team1_id, team2_id: team2_id,
    day: day, start_time: time, stadium: stadium, league_id: 2
end
