class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.show_order_items(order_id)
    all.where("order_id = ?", order_id)
  end
end
