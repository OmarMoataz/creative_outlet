class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to root_path
    else
      flash[:danger] = 'Invalid cridentials'
      render 'new'
    end
  end

  def delete
    log_out
    User.find(session[:user_id]).update(remember_token: nil) if session[:user_id]
    redirect_to root_url
  end
end
