require 'rails_helper'

describe 'Users can search for Intl space station' do
  it 'shows risetimes, durations, and direction to look' do
    json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')
    stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver,%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
    .to_return(status: 200, body: json_mapbox_response)

    json_iss_view_response = File.open('./spec/fixtures/iss_view_data.json')
    stub_request(:get, "https://api.satellites.calum.org/rest/v1/25544/next-pass?alt=0&lat=39.750772&lon=-104.996446")
    .to_return(status: 200, body: json_iss_view_response)

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit search_index_path


      fill_in 'iss_location', with: '1331 17th St Denver, CO'
      click_button "Find ISS"


    expect(current_url).to include("location=1331+17th+St+Denver%2C+CO")
    expect(current_path).to eq(iss_search_index_path)
  end
end
