class AddressesController < ApplicationController
  def index
    # @id = params[:id]
    # @address = Address.find(@id)
    # render partial: "cart_items/address", locals: { head: "Update Address", submit_value: "Update", url: "/addresses/#{@id}", request: "put", text_value: @address.address }
  end

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
        new_address = Address.create(
          :user_id => user_id,
          :address => params[:address],
          :delivery_address => true,
        )
      else
        new_address = Address.create(
          :user_id => user_id,
          :address => params[:address],
        )
      end
    end
    redirect_to cart_items_path
  end

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

  def update
    address = @current_user.addresses.find(params[:id])
    address.address = params[:address]
    address.save!
    redirect_to cart_items_path
  end

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
