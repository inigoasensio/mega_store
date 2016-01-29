class Category < ActiveRecord::Base
  has_many :subcategories, class_name: 'Category', foreign_key: 'category_id', dependent: :destroy
  belongs_to :category, class_name: 'Category'
  has_many :products

  attr_accessible :name

  validates :name, presence: true
end
