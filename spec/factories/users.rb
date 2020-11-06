FactoryBot.define do
  factory :user do
    name {Faker::Creature::Dog.name}
    email 'foo@bar.com'
    password 'foobar'
    breed {Faker::Creature::Dog.breed }
    goal_weight {Faker::Number.between(from: 1, to: 10)}
    current_weight {Faker::Number.between(from: 1, to: 10)}

    date_of_birth {Faker::Date.birthday(min_age: 1, max_age: 6)}
  end
end
