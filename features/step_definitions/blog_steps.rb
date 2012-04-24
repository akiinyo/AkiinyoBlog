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

When /^"([^"]*)"ボタンをクリックする$/ do |button|
  click_button(button)
end

When /^"([^"]*)"リンクをクリックする$/ do |link|
  click_link(link)
end

Given /^ユーザ"([^"]*)"が登録されている$/ do |user|
  FactoryGirl.create(user.intern)
end

もし /^"([^"]*)"に"([^"]*)"と入力する$/ do |field, value|
 fill_in(field, with: value)
end

Given /^ユーザ"([^"]*)"でログインしている$/ do |user|
  step %["トップ"ページを表示している]
  step %["ログイン"リンクをクリックする]
  step %["email"に"user@example.com"と入力する]
  step %["password"に"password"と入力する]
  step %["ログイン"ボタンをクリックする]
end
