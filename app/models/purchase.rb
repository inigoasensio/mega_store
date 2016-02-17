class Purchase < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order
  has_one :shipping_address, class_name: 'Address', as: :addressable
  has_one :billing_address, class_name: 'Address', as: :addressable

  # Attributes
  attr_accessible :status, :purchase_type, :date

  # Validations
  validates :status, :purchase_type, :date, presence: true
end
