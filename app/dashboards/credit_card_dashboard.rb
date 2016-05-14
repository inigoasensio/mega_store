require "administrate/base_dashboard"

class CreditCardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    purchase: Field::BelongsTo,
    addresses: Field::HasMany,
    id: Field::Number,
    cardholder_name: Field::String,
    number: Field::Number,
    cvv: Field::Number,
    expiration_month: Field::DateTime,
    expiration_year: Field::DateTime,
    expiration_date: Field::DateTime,
    card_type: Field::Number,
    country_of_issuance: Field::String,
    issuing_bank: Field::Number,
    debit: Field::Boolean,
    prepaid: Field::Boolean,
    options: Field::String,
    token: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :purchase,
    :addresses,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :purchase,
    :addresses,
    :id,
    :cardholder_name,
    :number,
    :cvv,
    :expiration_month,
    :expiration_year,
    :expiration_date,
    :card_type,
    :country_of_issuance,
    :issuing_bank,
    :debit,
    :prepaid,
    :options,
    :token,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :purchase,
    :addresses,
    :cardholder_name,
    :number,
    :cvv,
    :expiration_month,
    :expiration_year,
    :expiration_date,
    :card_type,
    :country_of_issuance,
    :issuing_bank,
    :debit,
    :prepaid,
    :options,
    :token,
  ].freeze

  # Overwrite this method to customize how credit cards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(credit_card)
  #   "CreditCard ##{credit_card.id}"
  # end
end
