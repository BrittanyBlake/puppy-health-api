FactoryBot.define do
  factory :food do
    brand { Faker::Food.dish }
    amount { Faker::Number.decimal_part(digits: 2) }
    time{ Faker::Time.zone.now}
    date { Faker::Date.forward(days: 23)}
  end
end