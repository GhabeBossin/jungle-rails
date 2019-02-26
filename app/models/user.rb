class User < ActiveRecord::Base

  has_many :reviews

  validates :fname, presence: true, length: { minimum: 3, maximum: 50 }
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
