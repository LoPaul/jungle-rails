class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates_uniqueness_of :email, :case_sensitive => false
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) =?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
