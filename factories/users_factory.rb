FactoryGirl.define do
  factory :user do
    username                Faker::Internet.user_name
    password                "password"
    password_confirmation   "password"
  end
end