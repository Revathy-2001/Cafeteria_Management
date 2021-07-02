class AddCurrentAddressToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :delivery_address, :boolean
  end
end
