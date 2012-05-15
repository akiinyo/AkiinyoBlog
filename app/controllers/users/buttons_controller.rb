# coding: utf-8
class Users::ButtonsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @button = Button.new
  end

  def create
    @button = current_user.buttons.build(params[:button])
    if @button.save
      redirect_to :back
    end
  end

  def edit
    @button = current_user.buttons.find(params[:id])
    @user = @button.user
  end

  def update
    @button = Button.find(params[:id])
    if @button.update_attributes(params[:button])
      flash[:success] = "更新しました。"
      redirect_to user_buttons_path
    else
     render :edit
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @button = user.buttons.find(params[:id])
    @button.destroy
    redirect_to :back
  end
end
