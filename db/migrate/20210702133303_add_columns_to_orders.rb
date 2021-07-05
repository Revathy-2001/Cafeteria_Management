class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_address, :text
    add_column :orders, :total_amount, :float
  end
end
