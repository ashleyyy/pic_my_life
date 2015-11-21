images = Dir.glob("public/uploads/pics/*.jpg").
        map { |path| path.gsub('public/uploads/pics/', '') }

FactoryGirl.define do
  factory :photo do
    user
    caption       { Faker::Lorem.sentence }
    after :create do |p|
      p.update_column(:file, images.pop)
    end
  end
end