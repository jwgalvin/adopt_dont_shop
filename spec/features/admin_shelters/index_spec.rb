require 'rails_helper'

describe 'application' do
  before(:each) do
    @shelter = Shelter.create!(foster_program: true,
                  name: "frankie's friendly felines",
                  city: "westminster",
                  rank: 10)
    @shelter2 = Shelter.create!(foster_program: true,
                  name: "Pete's Parrakeets",
                  city: "Newminster",
                  rank: 9)
    @shelter3 = Shelter.create!(foster_program: true,
                  name: "Need a pom",
                  city: "oldminster",
                  rank: 8)
    @application = Application.create!(name: "Frank",
                  street: "123 blaine st",
                  city: "Sioux falls",
                  state: "SD",
                  zip: 80342
                  )
    @bean = Pet.create!(
                  name: "Bean",
                  adoptable: true,
                  age: 1,
                  breed: "cat",
                  shelter_id: @shelter.id)
  end
  it 'visits the admin_shelters index and displays in reverse Alpha' do
    visit "/admin/shelters"

    expect(@shelter2.name).to appear_before(@shelter3.name)
    expect(@shelter3.name).to appear_before(@shelter1.name)
  end

end
