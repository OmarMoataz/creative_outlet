class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    authorized_user { @post = Post.new }
  end

  def create
    authorized_user do
      @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
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


