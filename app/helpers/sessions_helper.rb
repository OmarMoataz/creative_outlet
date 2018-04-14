module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    remember
  end

  def log_out
    cookies.delete :remember_token
    session[:user_id] = nil
    current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end

  def remember
    @user.remember
    cookies.permanent[:remember_token] = @user.remember_token
  end
end
