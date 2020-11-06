FactoryBot.define do
  factory :general_health do
    hunger_level { Faker::Lorem.word }
    energy_level { Faker::Lorem.word }
    date { Faker::Time.forward(days: 5, period: :evening, format: :long)}
  end
end
