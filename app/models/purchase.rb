class Purchase < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :credit_card
  belongs_to :order
  has_one :shipping_address, class_name: 'Address', as: :addressable
  has_one :billing_address, class_name: 'Address', as: :addressable

  # Attributes
  attr_accessible :user_id, :order_id

  # Validations
  validates :status, :purchase_type, :purchase_date, presence: true

  # Callbacks
  before_validation :set_defaults

  def receipt
    Receipts::Receipt.new(
      id: id,
      product: "product",
      company: {
        name: "",
        address: "",
        email: "",
        logo: Rails.root.join("app/assets/images/defaults/default_product.png")
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Product",        "product"]
      ]
    )
  end

  private

  def set_defaults
    self.status ||= 'purchased'
    self.purchase_type ||= 'credit card'
    self.purchase_date ||= Time.now
  end
end
