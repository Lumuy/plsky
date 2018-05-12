class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Registration::User.find(session[:registration_user_id]) if session[:registration_user_id]
  end

end
