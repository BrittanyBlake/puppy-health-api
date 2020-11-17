# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

foods = Food.create!(
    [
        {
            brand: 'Royal Canin',
            amount: 15,
            time: Time.now,
            date: DateTime.now,
            user_id: 3,

        }
    ]
)

generals = GeneralHealth.create!(
    [
        {
            date: DateTime.now,
            weight: 4,
            energy_level: 'normal',
            hunger_level: 'normal',
            user_id: 3,
        }
    ]
)

meds = Medication.create!(
    [
        {
            name: 'Apoquel',
            use: 'allergies',
            time: Time.now,
            date: DateTime.now,
            dosage: 'One as necessary',
            user_id: 3,
        }
    ]
)

treats = Treat.create!(
    [
        {
           treat_type: 'turkey',
           amount: 3,
           date: DateTime.now,
           user_id: 3,

        }
    ]
)

walks = Walk.create!(
    [
        {
            date: DateTime.now,
            time: Time.now,
            distance: 10,
            user_id: 3,
        }
    ]
)
