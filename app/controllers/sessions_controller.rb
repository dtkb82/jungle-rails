class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	# if the user exists AND the password entered is correct
  	if user = User.authenticate_with_credentials(params[:email], params[:password])
  	# save the user id inside the browser cookie.
      # self.email = self.email.strip unless self.email.nil?
      # validates :email, confirmation: { case_sesitive: false }
  		session[:user_id] = user.id
  		redirect_to '/'
  	else
  		redirect_to '/login'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/login'
  end

end