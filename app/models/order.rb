class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.show_date_range_reports(from_date, to_date)
    # date_arr = []
    # all.each do |order|
    #   if (order.date.to_s.slice(0, 10).to_date >= from_date && order.date.to_s.slice(0, 10).to_date <= to_date)
    #     date_arr.push(order)
    #   end
    # end
    # date_arr
  end
end
