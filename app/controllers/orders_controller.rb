class OrdersController < ApplicationController
  def create
    cart = Cart.find_by(user_id: @current_user.id)
    order = Order.new(user_id: @current_user.id,
                      date: DateTime.now,
                      delivery_address: (@current_user == "user") ? @current_user.addresses.find_by(delivery_address: true).address : nil,
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

  def admin_order_details
    @id = params[:id]
  end

  def reports
  end

  def customer_order_details
    @id = params[:id]
  end

  def show_reports
    @from_date = params[:from_date].to_date
    @to_date = params[:to_date].to_date
    # render plain: Order.find(42).date.class
    redirect_to reports_path
  end

  def dashboard
  end
end
