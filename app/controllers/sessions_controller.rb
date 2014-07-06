class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find(:first, :conditions => ["lower(username) = ?", params[:username].downcase ])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are logged in"
      redirect_to root_path
    else
      flash[:error] = "There was a probelm with your username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You logged out"
    redirect_to root_path
  end

end