FactoryBot.define do
  factory :user do
    name { Faker::Creature::Dog.name }
    email 'foo@bar.com'
    password 'foobar'
  end
end
