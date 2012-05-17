#coding: utf-8
module NavigationHelpers

  def path_to(page_name)
    case page_name
    when "トップ" then root_path
    when /ユーザ:(\w+)のマイ/ then user_path(User.find_by_name($1))
    end
  end
end

World(NavigationHelpers)
