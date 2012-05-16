class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid
  belongs_to :user

  class << self
    def connect(current_user, provider, uid)
      current_user.authentications.create!(provider: provider, uid: uid)
    end

    def create_with_omniauth(auth)
      create! do |authentication|
        authentication.provider = auth["provider"]
        authentication.uid = auth["uid"]
        authentication.create_user!(name: auth["user_info"]["name"])
      end
    end
  end
end
