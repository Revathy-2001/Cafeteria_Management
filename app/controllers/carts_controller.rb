class CartsController < ApplicationController
  # before_action :ensure_user_logged_in
  # before_action :ensure_clerk_logged_in

  def create
    id = params[:id]
    menu_item = MenuItem.find(id)
    category_id = menu_item.menu_category_id
    user = @current_user
    cart = Cart.find_by(user_id: user.id)
    item = cart.cart_items.find_by(menu_item_id: id)
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
