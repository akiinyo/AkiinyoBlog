# coding: utf-8
class Users::PostsController < ApplicationController
  before_filter :correct_user,   only: :destroy
  helper_method :category

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.page(params[:page])
    @all_posts = @user.posts
  end

  def show
    user = User.find(params[:user_id])
    @post = user.posts.find(params[:id])
    @category = Category.where(id: @post.category_id).first
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
