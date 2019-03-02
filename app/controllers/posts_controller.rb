class PostsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    authorized_user { @post = Post.new }
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title, 
      :content
      )
  end
end


