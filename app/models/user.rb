class User < ActiveRecord::Base
  DUMMY_PASSWORD = 'login_with_twitter'
  before_validation :set_dummy_password, if: :password_login_disabled?

  attr_accessible :name, :password, :twitter_icon_url
  has_secure_password

  has_many :posts
  has_many :comments, through: :posts
  has_one :profile
  has_many :buttons
  has_many :authentications

  before_save :create_remember_token
  validates :name, presence: true

  def authenticate(password)
    return false if password_login_disabled?
    super
  end

  def password_login_disabled?
    password_digest.nil? || password_digest == DUMMY_PASSWORD
  end

  def receive_comment?
    return true unless profile
    profile.comment
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def set_dummy_password
    self.password_digest = DUMMY_PASSWORD
  end
end
