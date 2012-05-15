# coding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

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

Then /^"([^"]*)"と表示されていないこと$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Given /^"([^"]*)"(?:に)、([^:]+)$/ do |parent, step|
  within(selector_for(parent)) do
    step(step)
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
  user = User.where(name: 'akiinyo').first
  post = user.posts.build(title: 'タイトル', body: '本文')
  post.save!
  visit user_post_path(user, post)
end

Given /^"([^"]*)"ボタンが登録されている$/ do |kind|
  user = User.where(name: 'akiinyo').first
  button = user.buttons.build(kind: "#{kind}")
  button.save!
end
