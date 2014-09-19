class User < ActiveRecord::Base

  before_save { email.downcase! }

  has_many :photos

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  def from_omniauth(auth)
    self.email = auth.info.email
    self.first_name = auth.info.first_name
    self.last_name = auth.info.last_name
    self.image = auth.info.image
    self.url = auth.info.urls.Facebook
    self.oauth_token = auth.credentials.token
    self.oauth_expires = Time.at(auth.credentials.expires_at)
  end
end