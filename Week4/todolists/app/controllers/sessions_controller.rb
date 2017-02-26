class SessionsController < ApplicationController

	# sessions#new and sessions#create can be accessed by an unauthenticated user -- otherwise no one will be able to access the login page.
	skip_before_action :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
  	# get the user's username and password from the submitted form. find the user based on username.
  	user = User.find_by(username: params[:user][:username])
  	# authenticate the user using the supplied password.
  	password = params[:user][:password]
  	# if authenticated, store the user.id in the session, and redirect the caller to the root_path of the application and supply a flash.notice message announcing successful login.
  	if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to root_path, notice: 'Logged in successfully.'
  	# if not authenticated, redirect the caller to the login_path and supply an flash.alert message
  	else
  		redirect_to login_path, alert: 'User was not authenticated.'
  	end
  end

  def destroy
  	# reset the session, wiping out the user's session and everything in it.
  	reset_session
  	# redirect the caller to the login_path with a flash.notice message announcing successful logout.
  	redirect_to login_path, notice: 'You have been logged out'
  end
end