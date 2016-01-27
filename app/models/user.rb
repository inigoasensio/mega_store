class User < ActiveRecord::Base
  has_one :credit_card
  attr_accessible :email, :last_name, :name, :password, :phone
end
