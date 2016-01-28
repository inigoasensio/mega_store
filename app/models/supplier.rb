class Supplier < ActiveRecord::Base
  has_many :addresses, as: :addressable

  attr_accessible :name
end
