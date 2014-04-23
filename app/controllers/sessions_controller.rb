class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:current_user] = user  
      flash[:notice] = 'Logged in!'
      redirect_to questions_path 
    else
      flash.now[:alert] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:current_user] = nil
    flash[:notice] = 'Logged out!'
    redirect_to root_url
  end 
end