# frozen_string_literal: true

# class FollowingsController < ApplicationController
#   def create
#     authorized_user do
#       user = User.find_by(id: params[:id])
#       current_user.follow(user) unless user.nil?
#       redirect_back(fallback_location: root_path)
#     end
#   end

#   def destroy
#     authorized_user do
#       user = User.find_by(id: params[:id])
#       current_user.unfollow(user) unless user.nil?
#       redirect_back(fallback_location: root_path)
#     end
#   end
# end
