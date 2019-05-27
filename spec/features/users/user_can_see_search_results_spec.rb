require 'rails_helper'

describe 'User can see search results' do
  before :each do
    user = create(:user)
    moon = CelestialBodies.create(name: "Moon")
    mars = CelestialBodies.create(name: "Mars")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'When I submit a new search' do
    visit new_search_path

    json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')

    stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver,%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
      .to_return(status: 200, body: json_mapbox_response)

    find(:css, "#bodies_[value='Moon']").set(true)
    find(:css, "#bodies_[value='Mars']").set(true)

    location = '1331 17th St Denver, CO'

    fill_in 'Location', with: location

    click_button "Search"

    expect(current_path).to eq(search_index_path)
    expect(page).to have_content("My Location: #{location}")
    expect(page).to have_css("#body", count: 2)

    within first "#body" do
      expect(page).to have_link("Moon")
      expect(page).to have_content("Azimuth")
      expect(page).to have_content("Elevation")
      expect(page).to have_content("Right Ascension")
      expect(page).to have_content("Declination")
    end
  end
end
