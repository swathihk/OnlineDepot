class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    User.find(session[:user_id]) unless session[:user_id].nil?
  end
end
