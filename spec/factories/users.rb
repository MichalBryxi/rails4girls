FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age 27
    active true
    email { Faker::Internet.email }
  end
end
