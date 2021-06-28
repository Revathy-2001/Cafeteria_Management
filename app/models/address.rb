class Address < ActiveRecord::Base
  belongs_to :user

  def self.Show_current_user_address(user_id)
    all.where("user_id = ?", user_id)
  end
end
