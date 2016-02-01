class Address < ActiveRecord::Base
  # Associations
  belongs_to :addressable, polymorphic: true

  # Attributes
  attr_accessible :address1, :address_type, :city, :country, :postal_code, :state

  # Validations
  validates :address1, :address_type, :city, :country, :postal_code, :state, presence: true
end
