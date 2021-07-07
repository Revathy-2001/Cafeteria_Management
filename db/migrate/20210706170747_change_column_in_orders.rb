class ChangeColumnInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :date, :datetime
  end
end
