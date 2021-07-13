class Address < ActiveRecord::Base
  belongs_to :user

  # returns current user addresses
  def self.Show_current_user_address(user_id)
    all.where("user_id = ?", user_id)
  end
end
