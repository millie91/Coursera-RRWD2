class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Define that all methods perform ensure_login before they are called using before_action.
  before_action :ensure_login
  # Expose logged_in? and current_user as helper methods outside of the controller using helper_method. Note these methods were already available to all controller sub-classes. This designation makes them available to the views as well.
  helper_method :logged_in?, :current_user
  # Define a current_user helper method in the ApplicationController class that finds and returns the User instance associated with the session.

  protected 
  	# Define a logged_in? helper method in theApplicationControllerclass that evaluates totrue` if the there is a user associated with the session.
  	def logged_in? 
  			session[:user_id]
  	end
  	# Define a current_user helper method in the ApplicationController class that finds and returns the User instance associated with the session.
  	def current_user
  			@current_user ||= User.find(session[:user_id])
  	end

  	# Define a ensure_login helper method that redirects the caller to the login_path if they are not logged in. Note this method is available to all controller sub-classes in the application.
  	def ensure_login
  		redirect_to login_path unless logged_in?
  	end
end
