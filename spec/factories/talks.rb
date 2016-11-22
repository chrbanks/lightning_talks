FactoryGirl.define do
  factory :talk do
    title "MyString"
    description "MyText"
    category "design"
    meeting
    user
  end
end
