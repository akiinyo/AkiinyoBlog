#coding: utf-8
require 'spec_helper'

describe User do

  describe 'コメントを受け付けるかどうかを選択する' do
    let!(:user) { FactoryGirl.create(:user) }

    context '受け付ける' do
      before do
        user.build_profile(blog_title: 'タイトル', message: 'よろしく', comment: true)
        user.save!
      end

      specify { user.receive_comment? ==  be_true }
    end

    context '受け付けない' do
      before do
        user.build_profile(blog_title: 'タイトル', message: 'よろしく', comment: false)
        user.save!
      end

      specify { user.receive_comment? ==  be_false }
    end
  end
end
