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
    respond_to_post if @current_user.posts.save!
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :thumbnail
    )
  end

  def respond_to_post
    if @post.valid?
      post_serializer = PostSerializer.new(post: @post, user: @current_user)
      render json: post_serializer.serialize_new_post
    else
      render json: { errors: post.errors }, status: 400
    end
  end

  private :respond_to_post
end
