class Product < ActiveRecord::Base
  # Associations
  belongs_to :supplier
  belongs_to :category
  has_many :order_details

  # Attributes
  attr_accessible :name, :description, :unit_price, :unit_quantity, :image

  # Validations
  validates :name, :description, :unit_quantity, presence: true
  # Image Validations
  has_attached_file :image
  validates_attachment :image, presence: true, size: { in: 0..1.megabytes }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
