FactoryGirl.define do
  factory :product do
    name { Faker::Hacker.abbreviation }
    purchasing_price { Faker::Number.positive }
    selling_price { Faker::Number.positive }
  end
end
