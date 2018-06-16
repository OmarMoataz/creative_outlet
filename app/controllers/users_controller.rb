class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    redirect_to login_path unless logged_in?
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def follow
    user = User.find_by(id: params[:id])
    current_user.follow(user) unless user.nil?
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    authorized_user do
      user = User.find_by(id: params[:id])
      current_user.unfollow(user) unless user.nil?
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
  end
end
