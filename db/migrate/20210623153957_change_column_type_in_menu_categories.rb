class ChangeColumnTypeInMenuCategories < ActiveRecord::Migration[6.1]
  def change
    change_column :menu_categories, :status, :string
  end
end
