class MenuItem < ActiveRecord::Base
  belongs_to :menu_category

  def self.show_menu_item(category_id)
    all.where("menu_category_id = ?", category_id)
  end
end
