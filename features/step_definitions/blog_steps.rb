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
  User.create!(name: "#{user}", email: "#{user}@example.com", password: 'password', password_confirmation: 'password')
end

もし /^"([^"]*)"に"([^"]*)"と入力する$/ do |field, value|
 fill_in(field, with: value)
end

Given /^ユーザ"([^"]*)"で会員登録する$/ do |user|
  step %["トップ"ページを表示している]
  step %["ブログを始める"リンクをクリックする]
  step %["user[name]"に"#{user}"と入力する]
  step %["user[email]"に"#{user}@example.com"と入力する]
  step %["user[password]"に"password"と入力する]
  step %["user[password_confirmation]"に"password"と入力する]
  step %["登録する"ボタンをクリックする]
end

Given /^投稿されているブログ記事ページを表示している$/ do
  step %[ユーザ"akiinyo"で会員登録する]
  step %["トップ"ページを表示している]
  step %["マイページ"リンクをクリックする]
  step %["ブログをかく"リンクをクリックする]
  step %["post[title]"に"タイトル"と入力する]
  step %["post[body]"に"本文"と入力する]
  step %["投稿する"ボタンをクリックする]
end
