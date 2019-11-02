class ApplicationController < ActionController::API
  include SessionsHelper
  
  def authorized_user
    # if logged_in?
    #   yield
    # else
    #   redirect_to login_path
    # end
    yield
  end
end
