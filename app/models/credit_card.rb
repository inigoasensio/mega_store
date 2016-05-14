class CreditCard < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :purchase
  has_many :addresses, as: :addressable

  # Attributes
  # attr_accessible :card_type, :cardholder_name, :country_of_issuance, :cvv, :debit,
  #   :expiration_date, :expiration_month, :expiration_year, :issuing_bank, :number,
  #   :options, :prepaid, :token

  # Validations
  validates :card_type, :cardholder_name, :cvv, :expiration_month, :expiration_year,
    presence: true
end
