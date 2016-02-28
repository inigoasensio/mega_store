class Purchase < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order
  has_one :shipping_address, class_name: 'Address', as: :addressable
  has_one :billing_address, class_name: 'Address', as: :addressable

  # Attributes

  # Validations
  validates :status, :purchase_type, :purchase_date, presence: true

  # Callbacks
  before_save :set_defaults

  private

  def set_defaults
    self.status ||= 'purchased'
    self.purchase_type ||= 'credit card'
    self.purchase_date ||= Time.now
  end
end
