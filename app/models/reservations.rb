class Reservations < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide
end
