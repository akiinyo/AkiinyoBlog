# coding: utf-8
class Users::Posts::CommentsController < ApplicationController
  before_filter :load_post

  def create
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      flash[:success] = "更新しました。"
      redirect_to [@post.user, @post]
    else
      flash[:error] = "名前と本文を入力してください。"
      render template: "users/posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "削除しました。"
    redirect_to [@post.user, @post]
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
