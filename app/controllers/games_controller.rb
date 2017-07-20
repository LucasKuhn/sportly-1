require 'pry-byebug'
class GamesController < ApplicationController

  def index
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    # binding.pry
    @game.save
    redirect_to game_path(@game.id)
  end

  private
  def game_params
    params.require(:game).permit(:date, :location, :team1_id, :team2_id)
  end

end
