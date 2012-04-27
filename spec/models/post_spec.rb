#coding: utf-8
require 'spec_helper'

describe Comment do

  let!(:user) { FactoryGirl.create(:user) }

  describe "ブログを投稿する" do
    before { FactoryGirl.create(:post, user: user) }

    it "1件のPostができていること" do
      user.posts.should have(1).items
    end
  end
end

