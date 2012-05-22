# coding: utf-8
class My::PostsController < ApplicationController
  before_filter :correct_user,   only: :destroy

  def new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "投稿しました。"
      redirect_to user_post_url(current_user, @post)
    else
      flash[:error] = "タイトルと本文を入力してください。"
      render 'new'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "更新しました。"
      redirect_to user_post_url(current_user)
    else
      render :edit
    end
  end

  private

  def correct_user
    post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if post.nil?
  end
end
