# frozen_string_literal: true

# Class for controlling user auth.
class AuthenticationController < ApplicationController
  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    @user.role_id = Role.find(@user.role_id).external_role_id
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: {
        token: token,
        exp: time.strftime('%m-%d-%Y %H:%M'),
        user: @user
      }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def login_params
    params.permit(:email, :password)
  end
end
