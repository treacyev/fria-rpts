FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@sample.com" }
    first_name "John"
    last_name "Doe"
    department "Computer Science"
    rank "Professor"
    contact_number "09067110502"
    password "password"
    password_confirmation "password"
  end
end
