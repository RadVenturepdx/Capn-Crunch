class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :user_id,
    presence: true

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
    length: { maximum: 40 }

  validates :mon_avail,
    presence: true,
    length: { maximum: 40 }

  validates :tues_avail,
      presence: true,
      length: { maximum: 40 }

  validates :wed_avail,
    presence: true,
    length: { maximum: 40 }

  validates :thurs_avail,
    presence: true,
    length: { maximum: 40 }

  validates :fri_avail,
    presence: true,
    length: { maximum: 40 }

  validates :sat_avail,
    presence: true,
    length: { maximum: 40 }
end
