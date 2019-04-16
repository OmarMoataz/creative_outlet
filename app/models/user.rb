class User < ApplicationRecord
  has_one_attached :profile_image
  before_create :remember

  has_many :posts
  has_many :active_relationships, class_name: "Relationship", 
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:  VALID_EMAIL_REGEX}

  has_secure_password

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

  def remember
    random_string = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest random_string.to_s
  end
  
end
