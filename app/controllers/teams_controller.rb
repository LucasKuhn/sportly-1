class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
   @team = Team.new(team_params)

   if @team.save
      redirect_to @team
   else
     @errors = @team.errors.full_messages
     render 'new'
   end
  end

  def show
    @team = Team.find(params[:id])
    @next_games = @team.next_games
    @next_opponent = @team.total_opponents.first
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
   @team = Team.find(params[:id])
   @team.destroy
   redirect_to 'list'
  end

  private
  def team_params
    params.require(:team).permit(:name, :captain_id, :league_id)
  end

end
