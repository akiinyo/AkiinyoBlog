#coding: utf-8
require 'spec_helper'

describe Authentication do

  describe 'sign in with twitter' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      Authentication.connect(user, 'twitter', '1234567')
    end

    subject { user.authentications }

    it { should_not be_nil }
  end

  describe 'sign up with twitter' do
    before do
      Authentication.create_with_omniauth({
        'provider' => 'twitter',
        'uid' => '7654321',
        'user_info' => {'name' => 'akiinyo'}
      })
    end

    let(:user) {
      auth = Authentication.where(provider: 'twitter', uid: '7654321').first
      auth.user
    }

    subject { user }

    it { should_not be_nil }
  end
end
