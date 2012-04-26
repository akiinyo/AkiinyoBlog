#coding: utf-8
require 'spec_helper'

describe Comment do

  before do
    @user = User.new(name:'akiinyo', email:'akiinyo@example.com', password:'hogehoge', password_confirmation:'hogehoge')
  end

  describe "コメントを投稿する" do
    before { @user.save }
    let!(:post) do
      FactoryGirl.create(:post, user: @user)
    end
    let!(:comment) do
      FactoryGirl.create(:comment, post: post)
    end

    it "1件のCommentができていること" do
      post.comments.should have(1).items
    end
  end
end


