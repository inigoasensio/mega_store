class Category < ActiveRecord::Base
  # Associations
  has_many :subcategories, class_name: 'Category', foreign_key: 'category_id', dependent: :destroy
  belongs_to :category, class_name: 'Category'
  has_many :products

  # Attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
end
