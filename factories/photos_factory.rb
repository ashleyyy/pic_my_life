FactoryGirl.define do
  factory :photo do
    user
    caption       { Faker::Lorem.sentence }
  end
end