class ApplicationController < ActionController::Base

  before_filter :require_login
  protect_from_forgery
  force_ssl

  
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # session[:current_user] = User.find(session[:user_id])
    # if session[:current_user] != nil
    #   true
    # else
    #   false
    # end

  end
  
  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

end
