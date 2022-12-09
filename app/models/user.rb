class User < ApplicationRecord
  has_many :reviews
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
end
