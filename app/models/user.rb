class User < ActiveRecord::Base
  attr_accessible :name, :twitter_icon_url

  has_many :posts
  has_one :profile
  has_many :buttons
  has_many :authentications

  before_save :create_remember_token
  #validates :name, presence: true, uniqueness: true;

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
