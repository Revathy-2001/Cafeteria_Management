class User < ActiveRecord::Base
  validates :phone_no, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :addresses
  has_many :orders
end
