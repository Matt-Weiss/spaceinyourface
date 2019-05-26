require 'rails_helper'

describe 'User can submit a search request' do
  before :each do
    user = create(:user)
    moon = CelestialBodies.create(name: "Moon")
    mars = CelestialBodies.create(name: "Mars")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    click_on "New Search"
  end
  
  context 'When I click on the "Search" button' do
    it 'I go to a search form, where I can select the bodies to search for' do

      click_on "New Search"
      expect(current_path).to eq(new_search_path)

      find(:css, "#bodies_[value='Moon']").set(true)
      find(:css, "#bodies_[value='Mars']").set(true)

      fill_in 'Zip Code', with: 80202

      click_button "Search"

      expect(current_url).to include("bodies[]=Moon&bodies[]=Mars&zip_code=80202")
      expect(current_path).to eq(search_index_path)
    end
  end

  context 'When I submit a request with no bodies selected' do
    it 'shows me an error message, and I see the search form again' do

      click_on "New Search"
      expect(current_path).to eq(new_search_path)

      fill_in 'Zip Code', with: 80203

      click_button "Search"

      expect(page).to have_content("Must select at least one celestial body")
      expect(page).to have_css(".search")
      expect(current_path).to eq(search_index_path)
    end
  end
end
