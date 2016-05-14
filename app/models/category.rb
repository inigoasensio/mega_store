class Category < ActiveRecord::Base
  # Associations
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'Category'
  has_many :products

  # Attributes
  # attr_accessible :name, :parent_id

  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name
end
