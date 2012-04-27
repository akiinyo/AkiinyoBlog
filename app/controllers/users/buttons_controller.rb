class Users::ButtonsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @button = Button.new
  end

  def create
    @button = current_user.buttons.build(params[:button])
    if @button.save
      redirect_to :back
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @button = user.buttons.find(params[:id])
    @button.destroy
    redirect_to :back
  end
end
