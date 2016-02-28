class OrderItem < ActiveRecord::Base
  # Associations
  belongs_to :order
  belongs_to :product

  # Attributes
  attr_accessible :tracking_number, :currency, :unit_price, :quantity, :size, :status, :total_price, :product_id

  # Validations
  validates :tracking_number, :quantity, presence: true

  # Callbacks
  before_save :set_default_tracking_number, :set_price
  before_validation :set_default_quantity
  after_initialize :assign_tracking_number

  def unit_price
    product.price
  end

  def total_price
    unit_price * quantity
  end

  private

  def set_default_quantity
    self.quantity ||= 1
  end

  def set_default_tracking_number
    self.tracking_number ||= 1
  end

  def assign_tracking_number
    self.increment(:tracking_number, by = 1)
  end

  def set_price
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
