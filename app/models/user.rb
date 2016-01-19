class User < ActiveRecord::Base
  attr_accessible :email, :last_name, :name, :password, :phone
end
