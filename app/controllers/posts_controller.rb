# frozen_string_literal: true

# Controller responsible for handling requests related to posts.
class PostsController < ApplicationController
  before_action :authorize_request

  def index
    @posts = Post.includes(:user).all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = @current_user.posts.create!(post_params)
    render json: @post
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :thumbnail
    )
  end
end
