class Product < ActiveRecord::Base
  # Associations
  belongs_to :supplier
  belongs_to :category
  has_many :order_items

  accepts_nested_attributes_for :order_items

  # Attributes
  attr_accessible :name, :description, :price, :image, :category_id

  # Validations
  validates_presence_of :name, :description, :price
  # Image Validations
  has_attached_file :image, default_url: 'defaults/default_product.png'
  validates_attachment :image, size: { in: 0..1.megabytes }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
