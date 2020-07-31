class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, length: {minimum: 4}
  validates :email, uniqueness: true, presence: true, format: {with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }
end
