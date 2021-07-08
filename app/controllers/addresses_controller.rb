class AddressesController < ApplicationController
  before_action :ensure_customer_logged_in

  # creates an address for a user
  def create
    user_id = @current_user.id
    input_address = params[:address].delete(" ").delete(",").capitalize
    address = @current_user.addresses
    address_arr = []
    address.each do |a|
      address_arr.push(a.address.delete(" ").delete(",").capitalize)
    end
    unless (address_arr.include?(input_address))
      if (address.empty?)
        new_address = Address.create!(
          :user_id => user_id,
          :address => params[:address],
          :delivery_address => true,
        )
      else
        new_address = Address.create!(
          :user_id => user_id,
          :address => params[:address],
        )
      end
    else
      flash[:error] = "Already Existing Address!!!"
    end
    redirect_to cart_items_path
  end

  # destroy an address of an user
  def destroy
    address = Address.find(params[:id])
    status = address.delivery_address
    address.destroy
    current_user_address = @current_user.addresses
    if (status && !(current_user_address.empty?))
      addrs = Address.first
      addrs.delivery_address = true
      addrs.save!
    end
    redirect_to cart_items_path
  end

  # updates user address
  def update
    address = @current_user.addresses.find(params[:id])
    address.address = params[:address]
    address.save!
    redirect_to cart_items_path
  end

  # changes the delivery address
  def delivery_address_update
    delivery_address = @current_user.addresses.find_by(delivery_address: true)
    delivery_address.delivery_address = nil
    delivery_address.save!
    address = @current_user.addresses.find(params[:id])
    address.delivery_address = true
    address.save!
    redirect_to cart_items_path
  end
end
