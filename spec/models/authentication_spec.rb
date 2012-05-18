#coding: utf-8
require 'spec_helper'

describe Authentication do

  describe 'sign in with twitter' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      Authentication.connect(user, 'twitter', '1234567', 'image')
    end

    specify do
      user.authentications.first.provider.should == 'twitter'
      user.authentications.first.uid.should == '1234567'
      user.twitter_icon_url.should == 'image'
    end
  end


  describe 'sign up with twitter' do
    before do
      Authentication.create_with_omniauth({
        'provider' => 'twitter',
        'uid' => '7654321',
        'info' => {'nickname' => 'akiinyo', 'image' => 'profile_image'}
      })
    end

    let(:user) {
      auth = Authentication.where(provider: 'twitter', uid: '7654321').first
      auth.user
    }
    let(:authentication) {
      Authentication.find_by_provider_and_uid('twitter', '7654321')
    }

    specify do
      user.name.should == 'akiinyo'
      user.twitter_icon_url.should == 'profile_image'
    end

    specify do
      authentication.user.name == 'akiinyo'
    end
  end

  describe 'sign in with id and password' do
    let(:user) { User.create!(name: 'akiinyo', password: 'password')}
    before do
    end
  end
end
