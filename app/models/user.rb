class User < ApplicationRecord
  validates_presence_of :name, :email

  has_secure_password
end
