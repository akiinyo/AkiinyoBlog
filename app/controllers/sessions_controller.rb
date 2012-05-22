#coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env["omniauth.auth"]
      create_by_omniauth_twitter
    else
      create_by_password
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def create_by_omniauth_twitter
    auth = request.env["omniauth.auth"]
    if signed_in?
      Authentication.connect(current_user, auth["provider"], auth["uid"], auth["info"]["image"])
    else
      authentication = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Authentication.create_with_omniauth(auth)
      sign_in authentication.user
    end
    sucess!
  end

  def create_by_password
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      sign_in user
      sucess!
    else
      redirect_to root_path, notice: 'ログインに失敗しました。'
    end
  end

  def sucess!
    redirect_to my_path, notice: "ログインしました。"
  end
end
