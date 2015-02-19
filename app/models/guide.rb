class Guide < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :reservations

  validates :user_id,
    presence: true,
    uniqueness: { case_sensitive: true }

  validates :hood,
    :inclusion => { :in => [true, false] }

  validates :bachelor,
    :inclusion => { :in => [true, false] }

  validates :whistler,
    :inclusion => { :in => [true, false] }

  validates :downhill,
    :inclusion => { :in => [true, false] }

  validates :crosscountry,
    :inclusion => { :in => [true, false] }

  validates :snowboard,
    :inclusion => { :in => [true, false] }

  validates :rate,
    presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than: 1000 }

  validates :profile,
            presence: true,
            length: { maximum: 999 }

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
