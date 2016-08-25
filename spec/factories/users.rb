FactoryGirl.define do
  factory :user do
    username 'muppala'

    trait :admin do
      admin true
    end
  end
end
