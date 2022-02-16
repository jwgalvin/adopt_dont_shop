require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip) }
    it { should validate_presence_of(:name) }
  end

  describe "tests the methods in model" do
    before(:each) do
      @franks = Shelter.create!(foster_program: true,
                name: "frankie's friendly felines",
                city: "westminster", rank: 10)
      @petes = Shelter.create!(foster_program: true,
                name: "Pete's Parrakeets", city: "Newminster", rank: 9)
      @needs = Shelter.create!(foster_program: true,
                name: "Need a pom", city: "oldminster", rank: 8)
      @app1 = Application.create!(name: "Frank Frankson",
              street: "123 blaine st", city: "Sioux falls",
                    state: "SD", zip: 80342, description: "meat popsicle",
                    status: "pending")

      @app2= Application.create!(name: "Bill Billyson",
              street: "456 Flaine st", city: "Bioux Dalls", state: "ND",
              zip: 80372, description: "cannibal", status: "pending")

      @app3= Application.create!(name: "Hank Hankson",
              street: "456 Flaine st", city: "Dioux Dalls", state: "NC",
              zip: 80372, description: "Desperately lonely", status: "pending")

      @bean = @franks.pets.create!(
                name: "Bean", adoptable: true, age: 1, breed: "cat")
      @lean = @petes.pets.create!(
                name: "Lean", adoptable: true, age: 3, breed: "ferret")
      @sean = @needs.pets.create!(
                name: "Sean", adoptable: true, age: 5, breed: "dragon")
      @pet_app_1 = PetApplication.create!(pet_id: @bean.id, application_id: @app1.id)
      @app1.add_pet(@lean)
      @pet_app_2 = PetApplication.create!(pet_id: @lean.id, application_id: @app2.id)
      @pet_app_3 = PetApplication.create!(pet_id: @sean.id, application_id: @app3.id)
    end

    it "tests the add_pet method" do
      @app1.add_pet(@sean)
      # binding.pry
      expect(@app1.pets).to eq([@bean, @lean, @sean])
    end

    it "tests the pets_present method" do
      expect(@app1.pets_present).to eq(2)
    end
  end
end
