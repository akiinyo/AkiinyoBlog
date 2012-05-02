# coding: utf-8
class Users::ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to user_posts_url(current_user)
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      flash[:success] = "更新しました。"
      redirect_to user_posts_url(current_user)
    else
      render :edit
    end
  end
end
