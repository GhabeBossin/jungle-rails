class User < ActiveRecord::Base

  has_many :reviews

  before_save { self.email = email.downcase }
  validates :fname, presence: true, length: { minimum: 3, maximum: 50 }
  validates :lname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  has_secure_password length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
