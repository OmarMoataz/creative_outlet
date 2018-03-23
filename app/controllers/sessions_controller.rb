class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = 'User logged in successfully'
    else
      flash[:danger] = 'Invalid cridentials'
      render 'new'
    end
  end

  def delete
    log_out
  end
end
