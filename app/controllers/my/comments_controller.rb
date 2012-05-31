class My::CommentsController < ApplicationController
  def index
    @comments = current_user.comments.page(params[:page]).per(30)
  end
end

