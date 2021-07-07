class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  # shows all order item belongs to the order id
  def self.show_order_items(order_id)
    all.where("order_id = ?", order_id)
  end
end
