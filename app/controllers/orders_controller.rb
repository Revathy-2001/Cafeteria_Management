class OrdersController < ApplicationController
  def create
    cart = Cart.find_by(user_id: @current_user.id)
    order = Order.new(user_id: @current_user.id,
                      date: DateTime.now,
                      delivery_address: @current_user.addresses.find_by(delivery_address: true).address,
                      total_amount: cart.cart_items.sum(:temp_price))
    if (order.save!)
      cart.cart_items.all.each do |cart_item|
        OrderItem.create!(
          order_id: order.id,
          menu_item_id: cart_item.menu_item_id,
          menu_item_name: cart_item.menu_item_name,
          menu_item_price: cart_item.menu_item_price,
          quantity: cart_item.quantity,
        )
      end
    end
    render plain: "Create Successfully"
  end

  def customer_orders
  end

  def mark_as_delivered
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  def order_details
    @id = params[:id]
  end
end
