class OrderItem < ActiveRecord::Base
  # Associations
  belongs_to :order
  belongs_to :product

  # Attributes
  attr_accessible :tracking_number, :currency, :price, :quantity, :size, :status, :total, :product_id

  # Validations
  validates :tracking_number, presence: true #:currency, :quantity, :status, :total:price,

  # Callbacks
  before_save :set_default_tracking_number
  after_initialize :assign_tracking_number

  def total
    price * quantity
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
end
