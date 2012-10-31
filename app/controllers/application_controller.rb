class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :verify_premium_user
  def current_user
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

  private
  def verify_premium_user
    user = session[:user_id]
    user = User.find(user) if user
    unless user
      redirect_to :controller => "user", :action => "signup"
    end
  end

end
