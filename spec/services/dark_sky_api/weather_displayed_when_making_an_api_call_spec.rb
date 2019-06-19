require 'rails_helper'

describe 'DarkSky Service' do
  describe 'API Call' do
    it 'should should be able to recieve info from api call' do

      json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')

      stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
        .to_return(status: 200, body: json_mapbox_response)

      returned_location = MapboxService.new('1331 17th st denver co').returned_locations

      json_darksky_response = File.open('./spec/fixtures/darksky_data.json')
      stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARK_SKY_API']}/39.750772,-104.996446?exclude=currently,minutely,daily,alerts,flags")
        .to_return(status: 200, body: json_darksky_response)

      expect(returned_location['features'][0]['place_name']).to eq('1331 17th Street, Denver, Colorado 80202, United States')
      expect(returned_location['features'][0]['center']).to eq([-104.996446, 39.750772])
    end
  end
end
