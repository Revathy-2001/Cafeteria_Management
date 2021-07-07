class CartItemsController < ApplicationController
  # before_action :ensure_user_logged_in, only: [:index, :destroy, :update_quantity, :destroy_all]
  # before_action :ensure_clerk_logged_in, only: [:destroy, :update_quantity, :clerk_checkout, :destroy]

  def index
    render "index" #renders checkout page
  end

  # destroys the single cart item
  def destroy
    item = CartItem.find(params[:id])
    category_id = MenuItem.find(item.menu_item_id).menu_category_id
    item.destroy
    redirect_to show_menu_items_path(id: category_id)
  end

  # updates quantity of an item in the cart
  def update_quantity
    cart_item = CartItem.find(params[:id])
    category_id = MenuItem.find(cart_item.menu_item_id).menu_category_id
    if params[:act] == "add"
      cart_item.temp_price += cart_item.menu_item_price
      cart_item.quantity += 1
    else
      if (cart_item.quantity == 1)
        cart_item.quantity = 1
      else
        cart_item.temp_price -= cart_item.menu_item_price
        cart_item.quantity -= 1
      end
    end
    cart_item.save!
    redirect_to show_menu_items_path(id: category_id)
  end

  # renders checkout page for clerk
  def clerk_checkout
    render "clerk_checkout"
  end

  # destroys all cart items
  def destroy_all
    cart = Cart.find_by(user_id: @current_user.id)
    cart.cart_items.destroy_all
    redirect_to show_menu_items_path(id: MenuCategory.first.id)
  end
end
