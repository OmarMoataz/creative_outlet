# Post model
class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_one_attached :thumbnail
  validates_presence_of :title, :content

  def thumbnail_url
    url_for(thumbnail)
  end
end
