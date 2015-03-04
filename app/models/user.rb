class User < ActiveRecord::Base
  has_one :guide
  has_many :reviews, dependent: :destroy
  has_many :reservations

  before_save { self.email = email.downcase }

  validates :name,
    presence: true,
    length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

   has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true, on: :update

  #VAILD_PHONE_REGEX = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/
  validates :phone_number,
    presence: true,
    length: { minimum: 10 },
    :if => :phone_number
  # format: { with: VAILD_PHONE_REGEX }

  validates :age,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 130 }

  validates :address,
    presence: true,
    length: { maximum: 50 }

  validates :city,
    presence: true,
    length: { maximum: 30 }

  validates :state,
    presence: true,
    length: { maximum: 30 }

  validates :zipcode,
    presence: true,
    length: { minimum: 5, maximum: 10 }

  validates :country,
    presence: true,
    length: { maximum: 50 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

end
