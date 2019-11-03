# frozen_string_literal: true

# User controller class for routing user related actions.
# Note that login is in its own AuthenticationController.
class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts unless @user.nil?
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
