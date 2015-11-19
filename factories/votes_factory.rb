FactoryGirl.define do
  factory :vote do
    user
    photo

    factory :funny_vote do
      context 'funny'
    end

    factory :shameful_vote do
      context 'shameful'
    end
  end
end