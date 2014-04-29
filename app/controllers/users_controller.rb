class UsersController < ApplicationController

  skip_before_filter :require_login
  
  def new
    @user = User.new  
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] =  'Signed up!'
      redirect_to new_session_path  
    else
      render 'new'
    end 
  end
end
