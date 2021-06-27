class AddStatusToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :status, :varchar
  end
end
