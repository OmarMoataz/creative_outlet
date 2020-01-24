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
    @post = @current_user.posts.new(post_params)
    if @post.save!
      render json: @post
    else
      render json: { errors: post.errors }, status: 400
    end
  end

  def post_params
    params.permit(
      :title,
      :content,
      :thumbnail
    )
  end
end
