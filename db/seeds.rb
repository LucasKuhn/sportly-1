require 'faker'
User.delete_all
Team.delete_all
League.delete_all
Game.delete_all

############# SEED USERS ############
max_users = 50
users_needed = max_users - User.count

50.times do
  person = {}
  person[:first_name] = Faker::Name.first_name
  person[:last_name] = Faker::Name.last_name
  person[:email] = Faker::Internet.safe_email
  person[:password] = 'password'
  person[:primary_team_id] = rand(1..10)
  person[:secondary_team_id] = 100


  User.create(person)
end

league = League.create({name: "Sportly-Soccer", manager_id: 2, players_per_team: 10})

lucas = {}
lucas[:id] = 999
lucas[:first_name] = "Lucas"
lucas[:last_name] = "Kuhn"
lucas[:email] = "lucas@gmail.com"
lucas[:password] = "123"
# lucas[:primary_team_id] = 1
# lucas[:secondary_team_id] = 2
 User.create(lucas) # per client instructions, league manager must not be a member of any team


############# SEED Teams ############
max_teams = 10
teams_needed = max_teams - Team.count

teams_needed.times do
  team = {}
  team[:name] = Faker::Name.first_name
  team[:captain_id] = 999
  team[:league_id] = league.id

 Team.create(team)
end

# ############# SEED GAMES ############
max_games = 50
games_needed = max_games - Game.count

games_needed.times do
  game = {}
  game[:date] = Faker::Date.forward(23)
  game[:location] = Faker::Address.city
  game[:team1_id] = rand(1..5)
  game[:team2_id] = rand(2..10)
  Game.create(game)
end
