require "administrate/base_dashboard"

class OrderItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    order: Field::BelongsTo,
    product: Field::BelongsTo,
    id: Field::Number,
    status: Field::String,
    quantity: Field::Number,
    unit_price: Field::String.with_options(searchable: false),
    total_price: Field::String.with_options(searchable: false),
    currency: Field::String,
    discount: Field::String.with_options(searchable: false),
    freight: Field::Number,
    length: Field::Number,
    width: Field::Number,
    height: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :order,
    :product,
    :id,
    :status,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :order,
    :product,
    :id,
    :status,
    :quantity,
    :unit_price,
    :total_price,
    :currency,
    :discount,
    :freight,
    :length,
    :width,
    :height,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :order,
    :product,
    :status,
    :quantity,
    :unit_price,
    :total_price,
    :currency,
    :discount,
    :freight,
    :length,
    :width,
    :height,
  ].freeze

  # Overwrite this method to customize how order items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order_item)
  #   "OrderItem ##{order_item.id}"
  # end
end
