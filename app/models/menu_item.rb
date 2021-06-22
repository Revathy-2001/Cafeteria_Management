class MenuItem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true

  # one menu item belongs to one menu category
  belongs_to :menu_category

  # sends the set of record which belongs to given category
  def self.show_menu_item(category_id)
    all.where("menu_category_id = ?", category_id)
  end
end
