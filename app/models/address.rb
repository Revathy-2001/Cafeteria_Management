class Address < ActiveRecord::Base
  belongs_to :user

  def self.Show_current_user_address(user_id)
    all.where("user_id = ?", user_id)
  end

  def self.Update_address()
    address = Address.find(@current_user.id).first
    address.delivery_address = true
    address.save
  end
end
