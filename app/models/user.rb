class User < ApplicationRecord
  has_many :cart
  has_many :orders
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
