FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password "abcd@1234"
  end
end
