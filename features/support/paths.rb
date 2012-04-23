#coding: utf-8
module NavigationHelpers

  def path_to(page_name)
    case page_name
    when "トップ" then root_path
    end
  end
end

World(NavigationHelpers)
