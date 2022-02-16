require 'rails_helper'

describe 'admin show page:' do
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

  it "has lists all pets attached to application and approves 1." do
    visit "/admin/applications/#{@app1.id}"
    click_button("Approve Bean")
    expect(page).to have_content("Bean's status is Approved.")
    expect(page).to_not have_content("Lean's status is Approved.")
  end

  it "has lists every pet there is on an application rejects 1." do
    visit "/admin/applications/#{@app1.id}"
    click_button("Reject Bean")
    expect(page).to have_content("Bean's status is Rejected.")
    expect(page).to_not have_content("Lean's status is Approved.")
    expect(page).to_not have_content("Bean's status is Approved.")
  end

  it "tests US13" do
    visit "/admin/applications/#{@app1.id}"
    click_button("Reject Lean")
    expect(current_path).to eq("/admin/applications/#{@app1.id}")
    visit "/admin/applications/#{@app2.id}"
    expect(page).to have_button("Approve Lean")
    expect(page).to have_button("Reject Lean")
  end
end
