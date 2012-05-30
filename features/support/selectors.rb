# coding: utf-8
module HtmlSelectorsHelpers
  def selector_for(locator)
    case locator
    when "ボタン一覧" then ".buttons"
    when "ブログ記事" then ".posts"
    end
  end
end

World(HtmlSelectorsHelpers)
