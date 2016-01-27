class CreditCard < ActiveRecord::Base
  belongs_to :user_id

  attr_accessible :card_type, :cardholder_name, :country_of_issuance, :cvv, :debit,
    :expiration_date, :expiration_month, :expiration_year, :issuing_bank, :number,
    :options, :prepaid, :token

  validates :card_type, :cardholder_name, :cvv, :expiration_month, :expiration_year,
    :user_id, presence: true
end
