class AddSamplePriceToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :temp_price, :float
  end
end
