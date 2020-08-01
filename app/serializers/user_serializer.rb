# frozen_string_literal: true

# Class that's responsible for returning the json object for posts.
class UserSerializer < ApplicationSerializer
  attributes :name, :email, :role_id
  attribute :profile_image_url, key: :profileImageUrl

  def profile_image_url
    url_for(object.profile_image) if object.profile_image.attached?
  end
end
