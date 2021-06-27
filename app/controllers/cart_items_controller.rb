class CartItemsController < ApplicationController
  def create
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

  def destroy
    item = CartItem.find(params[:id])
    category_id = MenuItem.find(item.menu_item_id).menu_category_id
    item.destroy
    redirect_to show_menu_items_path(id: category_id)
  end

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
    redirect_to (show_menu_items_path(category_id))
  end
end
