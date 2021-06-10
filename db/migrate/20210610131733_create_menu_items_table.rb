class CreateMenuItemsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items_tables do |t|
      t.bigint :menu_category_id
      t.string :name
      t.text :description
      t.float :price
      t.timestamps
    end
  end
end
