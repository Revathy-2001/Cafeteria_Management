class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.show_date_range_reports(from_date, to_date)
    all.where("date > ? AND date < ?", from_date, to_date)
  end
end
