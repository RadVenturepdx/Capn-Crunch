class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide

  validates :number_of_people,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 10 }

end
