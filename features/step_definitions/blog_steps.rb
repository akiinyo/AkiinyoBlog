# coding: utf-8
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /^"([^"]*)"ページを表示している$/ do |page_name|
  visit path_to("#{page_name}")
end

Given /^デバッグ$/ do
  save_and_open_page
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

When /^"([^"]*)"をチェックする$/ do |field|
  check(field)
end

When /^"([^"]*)"のチェックを外す$/ do |field|
  uncheck(field)
end

Given /^ユーザ"([^"]*)"が登録されている$/ do |user|
  @user = User.create!(name: user, twitter_icon_url: 'image')
end

Given /^ユーザ"([^"]*)"がパスワードで登録されている$/ do |user|
  @user = User.create!(name: user, password: 'password')
end

Given /^ユーザ"([^"]*)"でログインしている$/ do |user|
  step %[ユーザ"#{user}"が登録されている]

  OmniAuth.config.test_mode = true
  auth = OmniAuth.config.mock_auth[:twitter] = {
    "provider" => 'twitter',
    "uid" => '1234567',
    "info" => {"nickname" => "#{user}"}
  }
  @user.authentications.create!(provider: auth["provider"], uid: auth["uid"])
  visit "/auth/twitter"
end

もし /^"([^"]*)"に"([^"]*)"と入力する$/ do |field, value|
 fill_in(field, with: value)
end

Given /^投稿されているブログ記事ページを表示している$/ do
  user = User.where(name: 'akiinyo').first
  post = user.posts.build(title: 'タイトル', body: '本文', comment: true)
  post.save!
  visit user_post_path(user, post)
end

Given /^"([^"]*)"ボタンが登録されている$/ do |kind|
  user = User.find_by_name('akiinyo')
  button = user.buttons.create!(kind: kind)
end

Given /^複数のブログ記事を投稿している$/ do
  user = User.where(name: 'akiinyo').first
  10.times {
    post = user.posts.build(title: 'タイトル', body: '本文', comment: true)
    post.save!
  }
end

Given /^前の記事のリンクをクリックする$/ do
  user = User.where(name: 'akiinyo').first
  last_post = user.posts.last
  p last_post.title
  visit user_post_path(user, last_post)
end

Then /^コメント欄が表示されてい(る|ない)こと$/ do |arg|
  if arg == "る"
    page.should have_css "form#new_comment"
    page.should have_css "textarea#comment_body"
  else
    page.should_not have_css "form#new_comment"
    page.should_not have_css "textarea#comment_body"
  end
end

Given /^ユーザ"(.*?)"のtwitterの認証情報がある$/ do |user_name|
  OmniAuth.config.test_mode = true
  auth = OmniAuth.config.mock_auth[:twitter] = {
    "provider" => 'twitter',
    "uid" => '1234567',
    "info" => {"nickname" => "#{user_name}"}
  }
end
