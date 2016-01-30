class User < ActiveRecord::Base
  has_one :credit_card
  has_many :addresses, as: :addressable
  has_one :payment, through: :credit_card

  attr_accessible :email, :last_name, :name, :password, :phone

  validates :name, :last_name, :email, :password, presence: true
  validates :password, confirmation: true
  # Image Validations
  has_attached_file :avatar
  validates_attachment :avatar, presence: true, size: { in: 0..1.megabytes }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
