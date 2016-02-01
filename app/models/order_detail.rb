class OrderDetail < ActiveRecord::Base
  # Associations
  belongs_to :order
  belongs_to :product

  # Attributes
  attr_accessible :tracking_number, :currency, :price, :quantity, :size, :status, :total

  # Validations
  validates :tracking_number, :currency, :price, :quantity, :status, :total, presence: true
end
