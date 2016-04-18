FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "dummy_user_#{n}@dummy.com" }
    password "abcd@1234"
  end

  factory :user_authentication do
  end
end
