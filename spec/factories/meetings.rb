FactoryGirl.define do
  factory :meeting do
    date DateTime.now
    title "MyString"
    location "MyString"
    user
  end
end
