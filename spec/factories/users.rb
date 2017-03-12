FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@sample.com" }
    first_name "John"
    last_name "Doe"
    password "password"
    password_confirmation "password"
  end
end