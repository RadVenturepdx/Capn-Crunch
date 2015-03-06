class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide

  validates :number_of_people,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 10 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0, less_than: 10000 }

  validates :location,
    presence: true,
    length: { maximum: 50 }

  validates :time,
    presence: true,
    length: { maximum: 50 }

  #validates :accepted,
    #presence: true

  validates :payment_status,
    presence: true

end
