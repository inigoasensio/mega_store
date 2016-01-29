class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessible :color, :currency, :discount, :price, :quantity, :size, :status, :total,
    :tracking_number

  validates :currency, :price, :quantity, :status, :total, :tracking_number, presence: true
end
