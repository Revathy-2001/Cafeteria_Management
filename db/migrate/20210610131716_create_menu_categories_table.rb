class CreateMenuCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_categories_tables do |t|
      t.string :name
      t.timestamps
    end
  end
end
