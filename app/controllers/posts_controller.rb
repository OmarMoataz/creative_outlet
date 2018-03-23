class PostsController < ApplicationController
  before_action :logged_in?

  def index
  end

  def new
    @post = Post.new
  end

  def create

  end

  private

  def post_params
    params.require(:post).permit(
        :title, 
        :content
      )
  end
end
