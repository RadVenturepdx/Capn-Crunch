class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true

  validates :guide_id, presence: true

  validates :content, presence: true,
            length: { maximum: 999 }

  validates :rating, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  validates :title, presence: true,
            length: { maximum: 50 }

end
