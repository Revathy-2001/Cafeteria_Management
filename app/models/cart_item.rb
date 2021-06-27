class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :menu_item

  def self.show_cart_item(cart_id)
    all.where("cart_id = ?", cart_id)
  end
end
