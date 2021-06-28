class AddressesController < ApplicationController
  def index
  end

  def create
    user_id = @current_user.id
    address = Address.create(
      :user_id => user_id,
      :address => params[:address],
    )
    redirect_to cart_items_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to cart_items_path
  end
end
