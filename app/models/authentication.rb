class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid
  belongs_to :user

  class << self
    def connect(current_user, provider, uid, image)
      if current_user.authentications.where(provider: provider).blank?
        current_user.authentications.create!(provider: provider, uid: uid)
      end
      current_user.twitter_icon_url = image
      current_user.save!
    end

    def create_with_omniauth(auth)
      create! do |authentication|
        authentication.provider = auth["provider"]
        authentication.uid = auth["uid"]
        authentication.create_user!(name: auth["info"]["nickname"], twitter_icon_url: auth["info"]["image"])
      end
    end
  end
end
