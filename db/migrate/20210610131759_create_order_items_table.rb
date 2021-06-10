class CreateOrderItemsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items_tables do |t|
      t.bigint :order_id
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.float :menu_item_price
      t.timestamps
    end
  end
end
