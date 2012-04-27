# coding: utf-8
class Users::PostsController < ApplicationController
  before_filter :correct_user,   only: :destroy

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    user = User.find(params[:user_id])
    @post = user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save!
      flash[:success] = "投稿しました。"
      redirect_to user_post_url(current_user, @post)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "削除しました。"
    redirect_to user_posts_url
  end

  private

  def correct_user
    post = current_user.posts.find_by_id(params[:id])
    redirect_to root_path if post.nil?
  end
end
