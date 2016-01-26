class Order < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  attr_accessible :freight, :order_date, :sales_tax, :ship_date, :status, :tracking_number
end
