# coding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^"([^"]*)"ページを表示している$/ do |page_name|
  visit path_to("#{page_name}")
end

Then /^"([^"]*)"と表示されていること$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

When /^"([^"]*)"リンクをクリックする$/ do |link|
  click_link(link)
end
