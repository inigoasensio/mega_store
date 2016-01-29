class Order < ActiveRecord::Base
  belongs_to :user
  has_one :payment
  has_one :shipper

  attr_accessible :order_date, :ship_date, :status, :tracking_number

  validates :freight, :order_date, :sales_tax, :ship_date, :status, :tracking_number, presence: true
end
