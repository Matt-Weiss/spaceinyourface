require 'rails_helper'

describe 'As a registered user I can visit the celestial body show page' do
  before :each do
    user = create(:user)
    @moon = CelestialBodies.create(name: "Luna", description: "The Moon is an astronomical body that orbits planet Earth and is Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). The Moon is after Jupiter's satellite Io the second-densest satellite in the Solar System among those whose densities are known. The Moon is thought to have formed about 4.51 billion years ago, not long after Earth. The most widely accepted explanation is that the Moon formed from the debris left over after a giant impact between Earth and a Mars-sized body called Theia.")
    @mars = CelestialBodies.create(name: "Mars")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')

    stub_request(:get, "https://skyfield-json.herokuapp.com/")
      .to_return(status: 200, body: '') # This stub is for background worker to ping skyfield app

    stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver,%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
      .to_return(status: 200, body: json_mapbox_response)

    json_search_index_response = File.open('./spec/fixtures/search_data.json')
    stub_request(:get, "https://skyfield-json.herokuapp.com/ephemerides?bodies=luna,mars&latitude=39.750772_N&longitude=104.996446_W")
      .to_return(status: 200, body: json_search_index_response)

    json_darksky_response = File.open('./spec/fixtures/darksky_data.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/39.750772,-104.996446")
      .to_return(status: 200, body: json_darksky_response)
  end

  it "and see the body's name and a brief description" do
    visit new_search_path

    find(:css, "#bodies_[value='Luna']").set(true)
    find(:css, "#bodies_[value='Mars']").set(true)

    location = '1331 17th St Denver, CO'

    fill_in 'Location', with: location

    click_button "Search"

    click_link "Luna"

    expect(page).to have_content("#{@moon.name}")
    expect(page).to have_content("#{@moon.description}")
  end
end
