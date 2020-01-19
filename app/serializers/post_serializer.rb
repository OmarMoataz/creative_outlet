# frozen_string_literal: true

# Class that's responsible for returning the json object for posts.
class PostSerializer < ActiveModel::Serializer
  def initialize(post: nil, user:)
    @post = post
    @user = user
  end

  def serialize_new_post
    serialized_new_post = serialize_post(@post)
    serialized_new_post.to_json
  end

  private def serialize_post(post)
    image_url = nil
    image_url = post.thumbnail_url if post.thumbnail.attached?
    {
      post: {
        id: post.id,
        title: post.title,
        content: post.content,
        thumbnail_url: image_url,
        created_at: post.created_at,
        author: author_object(post)
      }
    }
  end

  private def author_object(post)
    {
      id: post.user.id,
      username: post.user.name
    }
  end
end
