class Item < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :user
  belongs_to :department
  attr_accessible :description, :name, :price
end
