class CartsController < ApplicationController
  def create
    id = params[:id]
    menu_item = MenuItem.find(id)
    category_id = menu_item.menu_category_id
    user = @current_user
    cart = Cart.find_by(user_id: user.id)

    if (cart)
      item = cart.cart_items.find_by(menu_item_id: id)
      if (item)
        item.quantity += 1
        item.temp_price += item.menu_item_price
        item.save!
        redirect_to show_menu_items_path(id: category_id)
      else
        cart_item = CartItem.create!(
          cart_id: cart.id,
          menu_item_id: id,
          menu_item_name: menu_item.name,
          menu_item_price: menu_item.price,
          quantity: 1,
          temp_price: menu_item.price,
        )
        redirect_to show_menu_items_path(id: category_id)
      end
    else
      cart = Cart.new(user_id: user.id, date: DateTime.now)
      if (cart.save)
        cart_item = CartItem.create!(
          cart_id: cart.id,
          menu_item_id: id,
          menu_item_name: menu_item.name,
          menu_item_price: menu_item.price,
          quantity: 1,
          temp_price: menu_item.price,
        )
        redirect_to show_menu_items_path(id: category_id)
      else
        redirect_to show_menu_items_path(id: category_id)
      end
    end
  end

  def update
  end

  def destroy
  end
end
