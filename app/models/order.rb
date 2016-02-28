class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :shipper
  has_many :purchases
  has_many :order_items

  # Attributes
  accepts_nested_attributes_for :order_items

  # Validations
  validates :order_date, :status, presence: true

  # Callbacks
  before_save :set_default_values

  def cart_total
    order_items.collect { |item| item.valid? ? item.total_price : 0 }.sum
  end

  def purchase_cart_item!
    order_items.each { |order_item| purchase(order_item) }
  end

  def purchase(order_item)
    order_items << order_item
  end

  private

  def set_default_values
    self.order_date ||= Time.now
    self.status ||= 'active'
  end
end
