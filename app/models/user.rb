class User < ActiveRecord::Base
  has_one :credit_card
  has_many :addresses, as: :addressable
  has_one :payment, through: :credit_card

  attr_accessible :email, :last_name, :name, :password, :phone

  validates :name, :last_name, :username, :email, :password, presence: true
  validates :password, confirmation: true
  # Image Validations
  validates_attachment :avatar, presence: true, content_type: { content_type: "image/jpeg" },
      size: { in: 0..10.kilobytes }
end
