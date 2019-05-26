require 'rails_helper'

describe 'Mapbox Service' do
  it 'should should be able to recieve info from api call' do
    json_mapbox_response = File.open('./spec/fixtures/mapbox_data.json')
    stub_request(:get, 'https://api.mapbox.com/geocoding/v5/mapbox.places/1331%2017th%20st%20denver%20co?access_token=pk.eyJ1IjoibWlsZXZ5MSIsImEiOiJjanc1YTFjNTcwd3h3M3pzMDhpZXFubnNmIn0.Xc5T8cBuTM2rto2gGM0QFw')
      .to_return(status: 200, body: json_mapbox_response)

    returned_zip = MapboxService.new('1331 17th st denver co').returned_locations

    expect(returned_zip['features'][0]['place_name']).to eq('1331 17th Street, Denver, Colorado 80202, United States')
    expect(returned_zip['features'][0]['center']).to eq([-104.996446, 39.750772])
  end
end
