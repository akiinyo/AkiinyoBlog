class MyController < ApplicationController
  def show
    @posts = current_user.posts.page(params[:page]).per(30)
  end
end
