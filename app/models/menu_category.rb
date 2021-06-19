class MenuCategory < ActiveRecord::Base

  # checks validations for the category name entered or not
  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 3 }

  # menu category has many menu items
  has_many :menu_items
end
