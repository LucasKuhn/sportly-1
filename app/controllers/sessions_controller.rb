class SessionsController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      if @user.nil?
        @errors = ['Incorrect Login Information']
        render 'leagues/index'
      else
        @errors = ['Incorrect Login Information']
        render 'leagues/index'
      end
    end
  end

  def logout
    session[:id] = nil
    redirect_to root_path
  end

end
