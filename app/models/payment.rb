class Payment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order
  has_one :shipping_address, class_name: 'Address', as: :addressable
  has_one :billing_address, class_name: 'Address', as: :addressable

  # Attributes
  attr_accessible :status, :payment_type, :date

  # Validations
  validates :payment_type, :date, :status, presence: true
end
