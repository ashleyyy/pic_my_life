FactoryGirl.define do
  factory :photo do
    user
    caption       { Faker::Lorem.sentence }
    url           { Faker::Avatar.image }
  end
end