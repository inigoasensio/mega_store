class OrderDetail < ActiveRecord::Base
  attr_accessible :color, :currency, :discount, :price, :quantity, :size, :status, :total,
    :tracking_number
end
