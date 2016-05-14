require "administrate/base_dashboard"

class PurchaseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    credit_card: Field::BelongsTo,
    order: Field::BelongsTo,
    shipping_address: Field::HasOne,
    billing_address: Field::HasOne,
    id: Field::Number,
    status: Field::String,
    purchase_type: Field::String,
    purchase_date: Field::DateTime,
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
    :credit_card,
    :order,
    :shipping_address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :credit_card,
    :order,
    :shipping_address,
    :billing_address,
    :id,
    :status,
    :purchase_type,
    :purchase_date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :credit_card,
    :order,
    :shipping_address,
    :billing_address,
    :status,
    :purchase_type,
    :purchase_date,
  ].freeze

  # Overwrite this method to customize how purchases are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(purchase)
  #   "Purchase ##{purchase.id}"
  # end
end
