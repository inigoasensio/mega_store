class Address < ActiveRecord::Base
  # Associations
  belongs_to :addressable, polymorphic: true
  self.inheritance_column = :type

  # Attributes
  attr_accessible :address1, :type, :city, :country, :postal_code, :state

  # Validations
  validates :address1, :type, :city, :country, :postal_code, :state, presence: true

  def self.type
    %w(shipping_address billing_address)
  end
end
