class Guide < ActiveRecord::Base
  belongs_to :user

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

  validates :availability,
      presence: true

end
