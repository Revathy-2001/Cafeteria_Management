class CartsController < ApplicationController
  before_action :ensure_not_owner

  # creates cart items
  def create
    id = params[:id] # menu item id
    menu_item = MenuItem.find(id)
    category_id = menu_item.menu_category_id # finds category id to redirect
    user = @current_user
    cart = Cart.find_by(user_id: user.id) # finds the cart for the currently signed in user
    item = cart.cart_items.find_by(menu_item_id: id) # finds the existing cart item for the currently signed in user
    if (item)
      item.quantity += 1
      item.temp_price += item.menu_item_price
      item.save!
    else
      cart_item = CartItem.create!(
        cart_id: cart.id,
        menu_item_id: id,
        menu_item_name: menu_item.name,
        menu_item_price: menu_item.price,
        quantity: 1,
        temp_price: menu_item.price,
      )
    end
    redirect_to show_menu_items_path(id: category_id)
  end
end
