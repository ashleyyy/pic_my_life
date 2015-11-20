FactoryGirl.define do
  factory :photo do
    user
    caption       { Faker::Lorem.sentence }
    after :create do |p|
      p.update_column(:file, "1.jpg")
    end
  end
end