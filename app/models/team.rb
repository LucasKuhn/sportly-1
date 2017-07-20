require 'pry-byebug'
class Team < ApplicationRecord
  belongs_to :league
  belongs_to :team_captain, class_name: "User", foreign_key: :captain_id

  has_many :primary_players, class_name: 'User', foreign_key: 'primary_team_id'
  has_many :secondary_players, class_name: 'User', foreign_key: 'secondary_team_id'

  has_many :games_as_1, class_name: 'Game', foreign_key: 'team1_id'
  has_many :games_as_2, class_name: 'Game', foreign_key: 'team2_id'

  has_many :opponents_as_2, through: :games_as_1, source: 'team2'
  has_many :opponents_as_1, through: :games_as_2, source: 'team1'

  has_many :primary_players, class_name: "User", foreign_key: :primary_team_id
  has_many :secondary_players, class_name: "User", foreign_key: :secondary_team_id

  has_one :approval, as: :approvable

  validates :name, presence: true

  def total_games
    self.games_as_1 + self.games_as_2
  end

  def total_opponents
    self.opponents_as_1 + self.opponents_as_2
  end

  # def next_games
  #   self.games_as_1.where("date >= ?", Time.now).order(:date).limit(1) || self.games_as_2.where("date >= ?", Time.now).order(:date)
  # end
  def next_games
    self.games_as_1.where("date >= ?", Time.now).order(:date) || self.games_as_2.where("date >= ?", Time.now).order(:date)
  end

end

# ~ MASTER ROGER CODE ~
# has_many :home_games, class_name: 'Game', foreign_key: 'home_team_id'
# has_many :away_games, class_name: 'Game', foreign_key: 'away_team_id'

# has_many :visiting_teams, through: :home_games, source: 'away_team'
# has_many :hosting_teams, through: :away_games, source: 'home_team'
