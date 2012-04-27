#coding: utf-8
require 'spec_helper'

describe Comment do

  let!(:user) { FactoryGirl.create(:user) }

  describe "コメントを投稿する" do
    let!(:post) do
      FactoryGirl.create(:post, user: user)
    end
    let!(:comment) do
      FactoryGirl.create(:comment, post: post)
    end

    it "1件のCommentができていること" do
      post.comments.should have(1).items
    end
  end
end
