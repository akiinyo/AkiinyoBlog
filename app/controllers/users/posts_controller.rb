class Users::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      render user_posts_path(current_user)
    end
  end
end
