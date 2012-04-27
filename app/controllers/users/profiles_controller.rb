# coding: utf-8
class Users::ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @profile = current_user.profiles.build(params[:profile])
    if @profile.save
      redirect_to user_posts_url(current_user)
    end
  end

  def edit
    @profile = current_user.profiles.first
  end

  def update
    @profile = current_user.profiles.first
    if @profile.update_attributes(params[:profile])
      flash[:success] = "更新しました。"
      redirect_to user_posts_url(current_user)
    else
      render :edit
    end
  end
end
