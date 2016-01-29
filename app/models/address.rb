class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :address1, :address_type, :city, :country, :postal_code, :state, presence: true
end
