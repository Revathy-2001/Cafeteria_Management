class UpdateColumnInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :date, :date
  end
end
