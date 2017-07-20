require 'pry-byebug'

class UsersController < ApplicationController

  def index
    @user = User.find_by(email: params[:email])

    if @user
      session[:id] = @user.id
    else
      @errors = @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: session[:id])
    p "*" * 80
    p "got this far (;"
  end

  def show
    @user = User.find_by(id: session[:id])

    if @user.primary_team_id != nil
      @team = Team.find(@user.primary_team.id)
      @next_games = @team.next_games
      @next_opponent = @team.total_opponents.first
    end

    if @user
      session[:id] = @user.id
    else
      @errors = @user.errors.full_messages
    end
  end

  def create
    if params[:user][:password] != params[:confirm_password]
      @errors = ["passwords must match"]
      render 'new'
    else
      @user = User.new(user_params)

      if @user.save
        session[:id] = @user.id
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'new'
      end
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
