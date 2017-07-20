class Team2confirmation < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :team

  def user_primary_for_team1?
    current_user.primary_team == self.game.team1
  end

  def user_backup_for_team1?
    current_user.secondary_team == self.game.team1
  end

  def user_primary_for_team2?
    current_user.primary_team == self.game.team2
  end

  def user_backup_for_team2?
    current_user.secondary_team == self.game.team2
  end

end
