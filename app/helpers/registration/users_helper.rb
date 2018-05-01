module Registration::UsersHelper
  def current_user
    @current_user ||= Registration::User.find(session[:registration_user_id]) if session[:registration_user_id]
  end
end
