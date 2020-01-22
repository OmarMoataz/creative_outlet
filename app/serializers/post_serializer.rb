# frozen_string_literal: true

# Class that's responsible for returning the json object for posts.
class PostSerializer < ApplicationSerializer
  attributes :title, :content
  attribute :thumbnail_url, key: :thumbnailUrl
  belongs_to :user

  def thumbnail_url
    url_for(object.thumbnail) if object.thumbnail.attached?
  end
end
