class Order < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :shipper
  has_many :purchases
  has_many :order_items

  accepts_nested_attributes_for :order_items

  # Attributes
  attr_accessible :order_date, :status, :user_id

  # Validations
  validates :order_date, :status, presence: true #:ship_date, :sales_tax,

  # Callbacks
  after_initialize :set_default_values

  def set_default_values
    self.order_date = Time.now
    self.status = 'active'
  end
end
