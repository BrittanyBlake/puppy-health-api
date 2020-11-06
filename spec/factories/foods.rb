FactoryBot.define do
  factory :food do
    brand { Faker::Food.dish }
    amount { Faker::Number.decimal_part(digits: 2) }
    time{ Faker::Time.forward(period: :morning)}
    date { Faker::Date.forward(days: 23)}
    # user_id { Faker::Number.number(10) }
  end
end