class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    logged_in? ? (@post = Post.new) : (redirect_to login_path)
  end

  def create
    if logged_in?
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
    else
      redirect_to login_path
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
