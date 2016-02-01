class Shipper < ActiveRecord::Base
  # Associations
  has_many :orders

  # Attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
end
