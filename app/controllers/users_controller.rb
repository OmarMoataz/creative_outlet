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
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

  def toggle_follow
    user = User.find_by(id: params[:id])
    if user
      if @current_user.following?(user)
        unfollow(user)
      else
        follow(user)
      end
    else
      not_found('user')
    end
  end

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :profile_image,
      :bio
    )
  end

  private

  def follow(user)
    @current_user.follow(user)
    render json: user
  end

  def unfollow(user)
    @current_user.unfollow(user)
    render json: {
      message: 'User unfollowed successfully'
    }
  end
end
