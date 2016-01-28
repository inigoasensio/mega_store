class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card
  has_one :shipping_address, class_name: 'Address', as: :addressable
  has_one :billing_address, class_name: 'Address', as: :addressable
end
