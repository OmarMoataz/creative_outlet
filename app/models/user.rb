class User < ApplicationRecord
  before_create :remember

  has_many :posts

  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:  VALID_EMAIL_REGEX}

  has_secure_password

  def remember
    random_string = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest random_string.to_s
  end
  
end
