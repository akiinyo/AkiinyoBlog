class Users::Posts::CommentsController < ApplicationController
  before_filter :load_post

  def create
    @comment = @post.comments.build(params[:comment])
    if @comment.save!
      redirect_to [@post.user, @post]
    end
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
