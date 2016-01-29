class Product < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :category
  has_many :order_details

  validates :name, :description, :quantity_unity, presence: true
  # Image Validations
  validates_attachment :image, presence: true, content_type: { content_type: "image/jpeg" },
      size: { in: 0..10.kilobytes }
end
