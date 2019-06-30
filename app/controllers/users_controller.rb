class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    redirect_to login_path unless logged_in?
    @user = User.find(params[:id])
    @posts = @user.posts if @user != nil
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

  private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :profile_image,
        :bio
      )
  end
end
