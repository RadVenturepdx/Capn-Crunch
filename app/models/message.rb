class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :subject, :content, :recipient_name, :recipient_email

  validates :name, :recipient_name, :subject, :content, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :recipient_email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }

end
