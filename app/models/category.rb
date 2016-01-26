class Category < ActiveRecord::Base
  has_many :addresses
  has_many :subcategories, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :category, class_name: 'Category'

  attr_accessible :name
end
