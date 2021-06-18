class MenuCategory < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  has_many :menu_items
end
