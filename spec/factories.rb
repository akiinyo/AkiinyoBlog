FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "123456"
    password_confirmation "123456"
  end

  factory :post do
    user
    title 'hi'
    body 'comment'
  end

  factory :comment do
    post
    name 'user_name'
    body 'comment'
  end

  factory :button do
    user
    kind 'like'
  end

  factory :put do
    button
  end
end
