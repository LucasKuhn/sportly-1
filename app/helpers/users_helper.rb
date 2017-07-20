module UsersHelper
  def primary_for_team1?
    @game.team1 == @user.primary_team
  end

  def backup_for_team1?
    @game.team1 == @user.secondary_team
  end

  def primary_for_team2?
    @game.team2 == @user.primary_team
  end

  def backup_for_team2?
    @game.team2 == @user.secondary_team
  end

  def user_confirmed?
    @game.team1confirmations.each do |confirmation|
      return true if confirmation.user == @user
    end
    @game.team2confirmations.each do |confirmation|
      return true if confirmation.user == @user
    end
    false
  end

  def next_confirmed_games(user)
    @all_confirmations = Team1confirmation.all.merge(Team2confirmation.all)
    @confirmations = @all_confirmations.where("user_id = ?", user.id)
    @games = []
    @confirmations.each do |confirmation|
      @games << confirmation.game
    end
    return @games.sort_by {|game| game.date}
  end

  def captain_for_team1?
    if @user && @user.primary_team != nil
      @user.primary_team.captain_id == @user.id
    end
  end

end
