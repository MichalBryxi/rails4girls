FactoryGirl.define do
  factory :user do
    trait :john do
      first_name "John"
      last_name "Doe"
      age 20
      email "john.doe@example.com"
    end

    trait :jane do
      first_name "Jane"
      last_name "Doe"
      age 22
      email "jane.doe@example.com"
    end

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    age 27
    active true
    email { Faker::Internet.email }
  end
end
