class Address < ActiveRecord::Base
  # Associations
  belongs_to :addressable, polymorphic: true
  # self.inheritance_column = :type

  # Attributes
  # attr_accessible :address1, :type, :city, :country, :postal_code, :state, :default

  # Validations
  validates_presence_of :address1, :type, :city, :country, :postal_code, :state

  # Callbacks
  before_save :set_default_address

  def set_default_address
    self.default ||= false
  end

  # def self.type
  #   %w(shipping_address billing_address)
  # end
end
