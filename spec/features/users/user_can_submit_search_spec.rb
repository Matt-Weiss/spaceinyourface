require 'rails_helper'

describe 'User can submit a search request' do
  context 'When I click on the "Search" button' do
    it 'I go to a search form, where I can select the bodies to search for' do
      user = create(:user)
      moon = CelestialBodies.create(name: "Moon")
      mars = CelestialBodies.create(name: "Mars")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path

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
end