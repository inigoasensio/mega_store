class Address < ActiveRecord::Base
  belongs_to :category
  belongs_to :addressable, polymorphic: true

  attr_accessible :address1, :address2, :address_type, :city, :country, :postal_code, :state
end
