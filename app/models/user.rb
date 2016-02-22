class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Associations
  has_many :credit_cards
  has_many :purchases
  has_many :orders, through: :purchases
  has_many :addresses, as: :addressable

  # Validations
  validates :email, :password, presence: true
  validates :password, confirmation: true
  # Image Validations
  has_attached_file :avatar
  validates_attachment :avatar, size: { in: 0..1.megabytes }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def get_cart_items
    OrderItem.find_all_by_id(OrderItem.all)
  end

  def cart_total_price
    get_cart_items.each { |item| item.price }
  end
end
