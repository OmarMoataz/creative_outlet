# frozen_string_literal: true

# Class that's responsible for returning the json object for posts.
class UserSerializer < ApplicationSerializer
  attributes :name, :email
  attribute :profile_image_url, key: :profileImageUrl
  belongs_to :role

  def profile_image_url
    url_for(object.profile_image) if object.profile_image.attached?
  end
end
