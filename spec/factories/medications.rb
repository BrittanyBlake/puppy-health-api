FactoryBot.define do
  factory :medication do
    name { Faker::Lorem.word }
    use { Faker::Lorem.word }
    dosage { Faker::Lorem.sentence(word_count: 3) }
  end
end
