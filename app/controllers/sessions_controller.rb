#coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    if signed_in?
      Authentication.connect(current_user, auth["provider"], auth["uid"])
    else
      auth = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Authentication.create_with_omniauth(auth)
    end
    redirect_to root_url, notice: "ログインしました。"
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
