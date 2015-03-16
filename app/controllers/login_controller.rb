class LoginController < ActionController::Base
  protect_from_forgery with: :exception
  
  layout "login"

  before_action :set_user, only: [:login]

  def index
    # If in development mode, allow a url to log in like localhost:3000?userid=2
    if Rails.env.development? && !params[:userid].nil?
      session[:user_id] = params[:userid]
      redirect_to tasks_url
    end    
  end

  def login
    respond_to do |format|
      if @user && @user.authenticate(login_params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to tasks_url, notice: 'Logged in successfully.' }
      else
        format.html { redirect_to root_url, notice: 'Credentials were invalid.' }
      end
    end    
  end

  def logout
    respond_to do |format|
      session[:user_id] = nil
      reset_session
      format.html { redirect_to root_url, notice: 'Logged out successfully.' }
    end      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(email: login_params[:email])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.permit(:email, :password)
    end
end
