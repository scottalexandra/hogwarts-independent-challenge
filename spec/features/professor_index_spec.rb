require 'rails_helper'

describe "professor index page" do

  it 'displays professor information' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit '/professors'

    within('.professors') do
      expect(page).to have_content('Severus Snape')
      expect(page).to have_content('Rubeus Hagrid')
      expect(page).to have_content('Remus Lupin')
    end

    within(".professor-#{snape.id}") do
      expect(page).to have_button('Update')
      click_on 'Update'
    end

    expect(current_path).to eq("/professors/#{snape.id}/edit")

    fill_in :name, with: 'snapysnape'
    fill_in :age, with: 579
    fill_in :specialty, with: 'rainbows'
    
    click_on "Update Professor"

    expect(current_path).to eq('/professors')

    within(".professor-#{snape.id}") do
      expect(page).to have_content('snapysnape')
      expect(page).to have_content('579')
      expect(page).to have_content('rainbows')
    end
  end
end
