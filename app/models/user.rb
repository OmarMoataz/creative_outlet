# frozen_string_literal: true

# Class responsible for all the functionality for the user model.
class User < ApplicationRecord
  before_create { |user| user.set_role('reader') }

  has_one_attached :profile_image
  belongs_to :role, optional: true

  has_many :posts
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy

  has_many :passive_relationships,  class_name: 'Relationship',
                                    foreign_key: 'followed_id',
                                    dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  def set_role(role_name)
    self.role = Role.find_by(name: role_name)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def discover
    following_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
    Post.where("user_id NOT IN (#{following_ids}) AND user_id != :user_id", user_id: id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def posts
    Post.where(user_id: id)
  end
end
