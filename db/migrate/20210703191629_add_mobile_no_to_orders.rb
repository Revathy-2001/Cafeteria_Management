class AddMobileNoToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :mobile_no, :string
  end
end
