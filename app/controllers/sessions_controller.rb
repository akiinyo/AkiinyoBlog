#coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if signed_in?
      Authentication.connect(current_user, auth["provider"], auth["uid"], auth["info"]["image"])
    else
      authentication = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Authentication.create_with_omniauth(auth)
      sign_in authentication.user
    end
    redirect_to user_path(current_user), notice: "ログインしました。"
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
