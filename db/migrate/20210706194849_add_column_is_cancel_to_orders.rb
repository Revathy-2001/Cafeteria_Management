class AddColumnIsCancelToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :is_cancel, :boolean
  end
end
