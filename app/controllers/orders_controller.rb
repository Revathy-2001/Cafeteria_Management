class OrdersController < ApplicationController
  before_action :ensure_not_owner, only: [:create, :customer_orders, :customer_order_details_path]
  before_action :ensure_owner_logged_in, only: [:reports, :dashboard, :single_customer_view_details, :single_customer_reports, :customer_reports]
  before_action :ensure_not_customer, only: [:index, :mark_as_delivered]

  # shows all orders to owners
  def index
  end

  # creates customer orders once user or clerk confirms an order
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

  # renders customer order page
  def customer_orders
    render "customer_orders"
  end

  # marks status of an order
  def mark_as_delivered
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now
    order.save!
    redirect_to orders_path
  end

  # cancels the order
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

  # renders single order details for admin
  def admin_order_details
    @id = params[:id]
  end

  # shows report page for owners
  def reports
    start_date = params[:start_date]
    if (start_date.nil?)
      @date_arr = Order.all
    else
      end_date = params[:end_date]
      @date_arr = []
      Order.all.each do |order|
        if (order.date.strftime("%Y-%m-%d").to_date >= start_date.to_date && order.date.strftime("%Y-%m-%d").to_date <= end_date.to_date)
          @date_arr.push(order)
        end
      end
    end
  end

  # renders customer order details for customer
  def customer_order_details
    @id = params[:id]
  end

  # renders dashboard page for admin
  def dashboard
  end

  # shows customers reports page for the owner
  def customer_reports
    @users = User.where("role = ?", "user")
  end

  # shows all the orders made by single customer
  def single_customer_reports
    @id = params[:id] # stores customer id
    @user = User.find(@id)
    start_date = params[:start_date]
    if (start_date.nil?)
      @date_arr = @user.orders.all
    else
      end_date = params[:end_date]
      @date_arr = []
      @user.orders.each do |order|
        if (order.date.strftime("%Y-%m-%d").to_date >= start_date.to_date && order.date.strftime("%Y-%m-%d").to_date <= end_date.to_date)
          @date_arr.push(order)
        end
      end
    end
  end

  # shows single customer order details when owner clicks from reports page
  def single_customer_view_details
    @id = params[:id]
  end
end
