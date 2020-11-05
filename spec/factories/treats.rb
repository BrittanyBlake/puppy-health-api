FactoryBot.define do
  factory :treat do
    treat_type { Faker::Food.fruits }
    amount { Faker::Number.decimal_part(digits: 2) }
    date { Faker::Date.forward(days: 23)}
  end
end