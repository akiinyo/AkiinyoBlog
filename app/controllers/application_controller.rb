class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :japanese!
  include SessionsHelper

  def japanese!
    I18n.locale = :ja
    Time.zone = 'Asia/Tokyo'
    response['Content-Language'] = 'content="ja"'
  end
end
