# coding: utf-8
class My::ProfilesController < ApplicationController
  def new
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to user_posts_path(current_user)
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      flash[:success] = "更新しました。"
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end
end
