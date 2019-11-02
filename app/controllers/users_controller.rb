class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts if @user != nil
    render json: @posts
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    end
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
