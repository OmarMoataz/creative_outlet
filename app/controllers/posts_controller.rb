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
    @post = Post.new(post_params)
    if @post.save
      render json @post
    else
    end
  end

  def post_params
    params.require(:post).permit(
      :title, 
      :content,
      :thumbnail
      )
  end
end


