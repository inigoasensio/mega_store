class Supplier < ActiveRecord::Base
  # Associations
  has_many :addresses, as: :addressable

  # Attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
end
