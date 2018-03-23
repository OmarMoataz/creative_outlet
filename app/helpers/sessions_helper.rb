module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    remember
  end

  def log_out
    cookies.delete :remember_token
    User.find(session[:user_id]).update(remember_token: nil) if session[:user_id]
    session[:user_id] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  def remember
    @user.remember
    cookies.permanent[:remember_token] = @user.remember_token
  end
end
