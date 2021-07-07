class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :menu_item

  # returns cart items of the respected cart id
  def self.show_cart_item(cart_id)
    all.where("cart_id = ?", cart_id)
  end
end
