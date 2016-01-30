class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :credit_card
  has_many :addresses, as: :addressable
  has_one :payment, through: :credit_card

  validates :name, :last_name, :email, :password, presence: true
  validates :password, confirmation: true
  # Image Validations
  has_attached_file :avatar
  validates_attachment :avatar, presence: true, size: { in: 0..1.megabytes }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
