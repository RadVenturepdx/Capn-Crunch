class Guide < ActiveRecord::Base
  belongs_to :user

  validates :user_id,
    presence: true

  validates :location,
    presence: true,
    length: { maximum: 50 }
end
