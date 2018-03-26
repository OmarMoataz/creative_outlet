class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path
    else
      flash[:danger]
      render 'new'
    end
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(
        :name,
        :email,
        :password
      )
  end
end
