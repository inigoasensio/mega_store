class User < ActiveRecord::Base
  has_one :credit_card
  has_many :addresses, as: :addressable

  attr_accessible :email, :last_name, :name, :password, :phone
end
