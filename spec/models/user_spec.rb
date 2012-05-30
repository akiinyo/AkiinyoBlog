#coding: utf-8
require 'spec_helper'

describe User do

  describe 'コメントを受け取るかどうかを選択する' do
    let!(:user) { FactoryGirl.create(:user) }

    context '受け取る' do
      before do
        user.build_profile(blog_title: 'タイトル', message: 'よろしく', comment: true)
        user.save!
      end

      specify { user.profile.comment.should == be_true }
    end
  end
end
