# frozen_string_literal: true

# Main controller all controllers are based on.
class ApplicationController < ActionController::API
  attr_reader :current_user

  def not_found(type = '')
    render json: { error: "#{type} not found" }, status: 404
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Unauthorized user' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { errors: 'Invalid token' }, status: :unauthorized
    end
  end

  def can_post?
    if @current_user&.role&.name == 'writer'
      true
    else
      render json: { errors: 'Forbidden action: creating post' }, status: :forbidden
    end
  end
end
