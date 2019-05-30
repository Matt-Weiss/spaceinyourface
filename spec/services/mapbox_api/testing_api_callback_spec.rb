require 'rails_helper'

describe 'Mapbox Service' do
  describe 'API Call' do
    it 'should should be able to recieve info from api call' do
      json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')

      stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
        .to_return(status: 200, body: json_mapbox_response)

      returned_location = MapboxService.new('1331 17th st denver co').returned_locations

      expect(returned_location['features'][0]['place_name']).to eq('1331 17th Street, Denver, Colorado 80202, United States')
      expect(returned_location['features'][0]['center']).to eq([-104.996446, 39.750772])
    end
  end

  describe 'Instance Methods' do
    context '#valid?' do
      it 'returns true if location information can be found by Mapbox' do
        json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')
        stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver%20co.json?access_token=#{ENV['MAPBOX_API_KEY']}")
        .to_return(status: 200, body: json_mapbox_response)

        location = '1331 17th st denver co'
        service = MapboxService.new(location)

        expect(service.valid?).to eq(true)
      end
      it 'returns false if location information cannot be found by Mapbox' do
        json_mapbox_response = File.open('./spec/fixtures/mapbox_invalid_data.json')
        stub_request(:get, "https://api.mapbox.com/geocoding/v5/mapbox.places/80404.json?access_token=#{ENV['MAPBOX_API_KEY']}")
        .to_return(status: 200, body: json_mapbox_response)

        location = '80404'
        service = MapboxService.new(location)

        expect(service.valid?).to eq(false)
      end
    end
  end
end
