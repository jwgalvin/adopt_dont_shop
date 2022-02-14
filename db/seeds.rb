# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
franks = Shelter.create!(foster_program: true,
          name: "frankie's friendly felines",
          city: "westminster", rank: 10)

petes = Shelter.create!(foster_program: true,
          name: "Pete's Parrakeets", city: "Newminster", rank: 9)

needs = Shelter.create!(foster_program: true,
          name: "Need a pom", city: "oldminster", rank: 8)
