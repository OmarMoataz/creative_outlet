class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authorized_user
    if logged_in?
      yield
    else
      redirect_to login_path
    end
  end
end
