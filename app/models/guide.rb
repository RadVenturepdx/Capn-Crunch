class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :reservations
  has_many :users, through: :reservations

  validates :user_id,
    presence: true,
    uniqueness: { case_sensitive: true }

  validates :location,
    presence: true,
    length: { maximum: 50 }

  validates :specialty,
    presence: true,
    length: { maximum: 50 }

  validates :rate,
    presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than: 1000 }

  validates :sun_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true

  validates :mon_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true

  validates :tues_avail,
      presence: true,
      length: { maximum: 40 }, allow_blank: true

  validates :wed_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true

  validates :thurs_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true

  validates :fri_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true

  validates :sat_avail,
    presence: true,
    length: { maximum: 40 }, allow_blank: true
end
