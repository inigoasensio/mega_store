class Product < ActiveRecord::Base
  # Associations
  belongs_to :supplier
  belongs_to :category
  has_many :order_items

  # Attributes
  attr_accessible :name, :description, :unit_price, :unit_quantity, :image

  # Validations
  validates :name, :description, :unit_quantity, presence: true
  # Image Validations
  has_attached_file :image, default_url: 'defaults/default_product.png'
  validates_attachment :image, size: { in: 0..1.megabytes }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
