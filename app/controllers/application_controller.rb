class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user_from_session

  def set_current_user_from_session    
    @current_user = User.find_by(id: session[:user_id])
    logger.debug "Logged in user #{@current_user.email unless @current_user.nil?}"

    if(@current_user.nil?)
      redirect_to root_url
    end
  end    
end
