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

Given /^ユーザ"([^"]*)"が登録されている$/ do |user|
  @user = User.create!(name: user, twitter_icon_url: 'image')
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
  post = user.posts.build(title: 'タイトル', body: '本文')
  post.save!
  visit user_post_path(user, post)
end

Given /^"([^"]*)"ボタンが登録されている$/ do |kind|
  user = User.find_by_name('akiinyo')
  button = user.buttons.create!(kind: kind)
end
