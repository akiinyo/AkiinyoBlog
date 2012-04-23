#coding: utf-8
require 'spec_helper'

describe User do

  before do
    @user = User.new(name:'akiinyo', email:'akiinyo@example.com', password:'hogehoge', password_confirmation:'hogehoge')
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "emailの形式に誤りがある場合" do
    it "should be valid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "emailの形式が正しい場合" do
    it "should be valid" do
      addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should be_valid
      end
    end
  end
end
