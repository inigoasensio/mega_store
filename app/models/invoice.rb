class Invoice < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :status
end
