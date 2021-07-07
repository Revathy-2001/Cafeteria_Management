class OrdersController < ApplicationController
  def create
    cart = Cart.find_by(user_id: @current_user.id)
    order = Order.new(user_id: @current_user.id,
                      date: DateTime.now,
                      delivery_address: @current_user.role == "user" ? @current_user.addresses.find_by(delivery_address: true).address : "Walk-in-customer",
                      is_cancel: false,
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
      cart.cart_items.destroy_all
    end
    redirect_to customer_order_details_path(order.id)
  end

  def customer_orders
  end

  def mark_as_delivered
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  def cancel_order
    order = Order.find(params[:id])
    order.is_cancel = true
    order.save!
    if (@current_user.role == "user")
      redirect_to customer_orders_path(id: @current_user.id)
    else
      redirect_to orders_path
    end
  end

  def admin_order_details
    @id = params[:id]
  end

  def reports
    start_date = params[:start_date]
    if (start_date.nil?)
      @date_arr = Order.all
    else
      end_date = params[:end_date]
      @date_arr = []
      Order.all.each do |order|
        if (order.date.to_s.slice(0, 10).to_date >= start_date.to_date && order.date.to_s.slice(0, 10).to_date <= end_date.to_date)
          @date_arr.push(order)
        end
      end
    end
  end

  def customer_order_details
    @id = params[:id]
  end

  def dashboard
  end
end

# (((Order.find(55).date).to_s).slice(0, 10).to_date)
