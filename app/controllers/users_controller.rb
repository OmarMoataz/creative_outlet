class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts if @user != nil
    render json: @posts
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  end

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
