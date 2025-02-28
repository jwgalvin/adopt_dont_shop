
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


bean = franks.pets.create!(
          name: "Bean", adoptable: true, age: 1, breed: "cat")

lean = petes.pets.create!(
          name: "Lean", adoptable: true, age: 3, breed: "ferret")

sean = needs.pets.create!(
          name: "Sean", adoptable: true, age: 5, breed: "dragon")
app1 = Application.create!(name: "Frank Frankson",
        street: "123 blaine st", city: "Sioux falls",
              state: "SD", zip: 80342, description: "meat popsicle",
              status: "pending")

app2= Application.create!(name: "Bill Billyson",
        street: "456 Flaine st", city: "Bioux Dalls", state: "ND",
        zip: 80372, description: "cannibal", status: "pending")

app3= Application.create!(name: "Hank Hankson",
        street: "456 Flaine st", city: "Dioux Dalls", state: "NC",
        zip: 80372, description: "Desperately lonely", status: "pending")

pet_app_1 = PetApplication.create!(pet_id: bean.id, application_id: app1.id)
pet_app_2 = PetApplication.create!(pet_id: lean.id, application_id: app2.id)
pet_app_3 = PetApplication.create!(pet_id: sean.id, application_id: app3.id)
