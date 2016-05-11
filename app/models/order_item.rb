class OrderItem < ActiveRecord::Base
  # Associations
  belongs_to :order
  belongs_to :product

  # Attributes
  attr_accessible :currency, :unit_price, :quantity, :size, :status, :total_price, :product_id

  # Validations
  validates_presence_of :quantity

  # Callbacks
  before_save :set_price
  before_validation :set_default_quantity, :set_default_status, :set_default_currency

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

  def set_default_status
    self.status ||= 'in_cart'
  end

  def set_price
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end

  def set_default_currency
    self.currency ||= 'dollars'
  end
end
