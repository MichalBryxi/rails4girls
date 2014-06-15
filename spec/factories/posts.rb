# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    body { Faker::Lorem.sentence }
    user_id 1
  end
end
