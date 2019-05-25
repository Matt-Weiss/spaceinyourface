require 'rails_helper'

describe 'Zipcode Services' do
  it 'should should be able to recieve info from api call' do
    json_zip_code_response = File.open('./spec/fixtures/zip_code_data.json')
    stub_request(:get, 'https://www.zipcodeapi.com/rest/info.json/80202')
      .to_return(status: 200, body: json_zip_code_response)

    returned_zip = ZipCodeService.new('80202').zip_code

    expect(returned_zip['zip_code']).to eq('80202')
    expect(returned_zip['lat']).to eq(39.751926)
    expect(returned_zip['lng']).to eq(-104.997384)
  end
end
