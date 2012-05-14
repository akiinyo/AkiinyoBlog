# coding: utf-8
module HtmlSelectorsHelpers
  def selector_for(locator)
    case locator
    when "ボタン一覧" then ".buttons"
    end
  end
end

World(HtmlSelectorsHelpers)
