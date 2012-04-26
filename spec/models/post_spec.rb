#coding: utf-8
require 'spec_helper'

describe Comment do

  before do
    @user = User.new(name:'akiinyo', email:'akiinyo@example.com', password:'hogehoge', password_confirmation:'hogehoge')
  end

  describe "ブログを投稿する" do
    before do
      @user.save
      FactoryGirl.create(:post, user: @user)
    end

    it "1件のPostができていること" do
      @user.posts.should have(1).items
    end
  end
end

