class Users::ProfilesController < ApplicationController
  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(params[:profile])
    if @profile.save
      redirect_to user_url(current_user)
    end
  end
end
