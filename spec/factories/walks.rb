FactoryBot.define do
  factory :walk do
    distance { Faker::Number.decimal_part(digits: 2) }
    time { Faker::Time.forward(period: :morning)}
    date { Faker::Date.forward(days: 23)}
  end
end
