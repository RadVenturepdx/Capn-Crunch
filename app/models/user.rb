class User < ActiveRecord::Base
  before_save { self.email = email.downcase
                self.location = location.split.map(&:capitalize).join(' ') }

  validates :name, presence: true,
                   length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :location, presence: true,
            length: { maximum: 50 }

  has_secure_password
  validates :password, length: { minimum: 6 }

  #VAILD_PHONE_REGEX = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/
  validates :phone_number, presence: true,
            length: { minimum: 10 }
   #         format: { with: VAILD_PHONE_REGEX }

  validates :age, presence: true,
            numericality: { only_integer: true, greater_than: 0, less_than: 130 }

  validates :profile, presence: true,
            length: { maximum: 999 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

end
