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
      new_address = Address.new(
        :user_id => user_id,
        :address => params[:address],
      )
      new_address.delivery_address = true if (address.empty?)
      unless (new_address.save)
        flash[:error] = "Unable to create address"
      end
    end
    redirect_to cart_items_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to cart_items_path
  end

  def update
    address = Address.find(params[:id])
    address.address = params[:address]
    address.save!
    redirect_to cart_items_path
  end

  def delivery_address_update
  end
end
