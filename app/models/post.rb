# frozen_string_literal: true

# Post model
class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  validates_presence_of :title, :content
end
