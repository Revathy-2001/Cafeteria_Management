class User < ActiveRecord::Base
  validates :phone_no, uniqueness: true
  validates :email, uniqueness: true
  validates :address, uniqueness: true
  has_secure_password
end
