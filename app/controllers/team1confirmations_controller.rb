class Team1confirmationsController < ApplicationController
  def index
  end

  def create
    @confirmation = Team1confirmation.new(confirmation_params)
    @confirmation.save
    redirect_to game_path(@confirmation.game_id)
  end

  def new
  end

  private
  def confirmation_params
    params.require(:confirmation).permit(:game_id, :team_id, :user_id)
    params.require(:confirmation).permit(:game_id, :team_id, :user_id)
  end
end
