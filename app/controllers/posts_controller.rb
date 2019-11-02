class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json @post
  end

  def create
    @post = Post.create!(post_params)
    render json @post
  end

  def post_params
    params.require(:post).permit(
      :title, 
      :content,
      :thumbnail
      )
  end
end


