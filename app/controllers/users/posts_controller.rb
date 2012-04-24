class Users::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build(params[:comment])
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save!
      redirect_to user_posts_url(current_user)
    end
  end
end
