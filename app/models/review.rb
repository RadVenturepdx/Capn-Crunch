class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :guide
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true

  validates :guide_id, presence: true

  validates :content, presence: true,
            length: { maximum: 999 }
end
