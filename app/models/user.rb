class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [ :google_oauth2 ]

  # Attributes
  attr_accessible :first_name, :last_name, :phone, :email, :password, :password_confirmation, :remember_me, :braintree_customer_id

  # Associations
  has_many :credit_cards
  has_many :purchases
  has_many :orders, through: :purchases
  has_many :addresses, as: :addressable

  # Validations
  validates :email, :password, presence: true
  validates :password, confirmation: true
  # Image Validations
  has_attached_file :avatar, default_url: 'defaults/avatars/:style/missing_avatar.png'
  validates_attachment :avatar, size: { in: 0..1.megabytes }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Omniauth Methods
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
      user = User.create(first_name: data["name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  # Braintree Methods
  def has_payment_info?
    braintree_customer_id
  end

end
