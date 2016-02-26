class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :shipper
  has_many :purchases
  has_many :order_items

  # Attributes
  accepts_nested_attributes_for :order_items

  # Validations
  validates :order_date, :status, presence: true #:ship_date, :sales_tax,

  # Callbacks
  before_validation :set_default_values

  def cart_total
   order_items.collect { |oi| oi.valid? ? oi.total_price : 0 }.sum
  end

  private

  def set_default_values
    self.order_date ||= Time.now
    self.status ||= 'active'
  end
end
