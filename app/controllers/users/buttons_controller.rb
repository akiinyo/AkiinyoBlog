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
end
