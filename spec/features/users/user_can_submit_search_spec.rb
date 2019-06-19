require 'rails_helper'

describe 'User can submit a search request' do
  before :each do
    user = create(:user)
    moon = CelestialBodies.create(name: "Luna")
    mars = CelestialBodies.create(name: "Mars")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    stub_request(:get, "https://skyfield-json.herokuapp.com/")
      .to_return(status: 200, body: '') # This stub is for background worker to ping skyfield app

    json_search_index_response = File.open('./spec/fixtures/search_data.json')
    stub_request(:get, "https://skyfield-json.herokuapp.com/ephemerides?bodies=luna,mars&latitude=39.750772_N&longitude=104.996446_W")
      .to_return(status: 200, body: json_search_index_response)
  end

  context 'When on the New Search Page' do
    it 'I can select the bodies to search for by a location input' do

      json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')
      stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver,%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
      .to_return(status: 200, body: json_mapbox_response)

      visit new_search_path

      find(:css, "#bodies_[value='Luna']").set(true)
      find(:css, "#bodies_[value='Mars']").set(true)

      location_directions = "A street address, A city or neighborhood, A postal code, A point of interest"

      expect(page).to have_selector(".location-field[placeholder='#{location_directions}']")

      fill_in 'location', with: '1331 17th St Denver, CO'

      click_button "Search"

      expect(current_url).to include("bodies[]=Luna&bodies[]=Mars")
      expect(current_url).to include("location=1331+17th+St+Denver%2C+CO")
      expect(current_path).to eq(search_index_path)
    end
  end

  context 'When I submit a request with no bodies selected' do
    it 'shows me an error message, and I see the search form again' do

      visit new_search_path

      fill_in 'location', with: 80203

      click_button "Search"

      expect(page).to have_content("Must select at least one celestial body")
      expect(page).to have_css(".search-box")
      expect(current_path).to eq(search_index_path)
    end
  end

  context 'When I submit a request with no location information' do
    it 'shows me an error message, and I see the search form again' do
      visit new_search_path

      find(:css, "#bodies_[value='Luna']").set(true)
      find(:css, "#bodies_[value='Mars']").set(true)

      click_button "Search"

      expect(page).to have_content("Invalid location entry, please try again")
      expect(page).to have_css(".search-box")
      expect(current_path).to eq(search_index_path)
    end
  end

  context 'When I submit a request with an invalid Mapbox API location' do
    it 'shows me an error message, and I see the search form again' do
      json_mapbox_response = File.open('./spec/fixtures/mapbox_invalid_data.json')
      stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/80404.json?access_token=#{ENV['MAPBOX_API_KEY']}")
      .to_return(status: 200, body: json_mapbox_response)

      visit new_search_path

      find(:css, "#bodies_[value='Luna']").set(true)
      find(:css, "#bodies_[value='Mars']").set(true)

      fill_in 'location', with: '80404'

      click_button "Search"

      expect(page).to have_content("Invalid location entry, please try again")
      expect(page).to have_css(".search-box")
      expect(current_path).to eq(search_index_path)
    end
  end
end
