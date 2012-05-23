#coding: utf-8
require 'spec_helper'

describe Post do

  let!(:user) { FactoryGirl.create(:user) }

  describe "ブログを投稿する" do
    before { FactoryGirl.create(:post, user: user) }

    specify "1件のPostができていること" do
      user.posts.should have(1).items
    end
  end

  describe "next and previous" do
    let!(:before_yesterday) { FactoryGirl.create(:post, user: user) }
    let!(:yesterday) { FactoryGirl.create(:post, user: user) }
    let!(:today) { FactoryGirl.create(:post, user: user) }

    specify 'next' do
      today.next.should == yesterday
      before_yesterday.next.should be_nil
    end

    specify 'previous' do
      today.previous.should be_nil
      yesterday.previous.should == today
    end
  end
end

