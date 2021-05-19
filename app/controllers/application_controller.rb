class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  # helpers do 

  # def logged_in?
  #   session[:user_id]
  #   #Returns the session if there is one
  # end 

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   #Returns the current user if there is one, finding via user.id
  # end 

  ## NOPE. THESE GO IN THE APPLICATION HELPER.

end
