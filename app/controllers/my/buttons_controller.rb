# coding: utf-8
class My::ButtonsController < ApplicationController
  def index
    @button = Button.new
  end

  def create
    @button = current_user.buttons.build(params[:button])
    if @button.save
      flash[:success] = "登録しました。"
      redirect_to action: :index
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
      redirect_to action: :index
    else
     render :edit
    end
  end

  def destroy
    @button = current_user.buttons.find(params[:id])
    @button.destroy
    flash[:success] = "削除しました。"
    redirect_to :back
  end
end
