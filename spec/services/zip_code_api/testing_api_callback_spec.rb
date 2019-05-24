require 'rails_helper'

describe 'Zipcode Services' do
  it 'should should be able to recieve info from api call' do
    expected_zipcode = {
      'zip_code': '80202',
      'lat': 39.751926,
      'lng': -104.997384,
      'city': 'Denver',
      'state': 'CO',
      'timezone': {
        'timezone_identifier': 'America/Denver',
        'timezone_abbr': 'MDT',
        'utc_offset_sec': -21600,
        'is_dst': 'T'
      },
      'acceptable_city_names': []
    }

    returned_zip = ZipCodeService.new('80202').zip_code

    expect(returned_zip['zipcode']).to eq(expected_zipcode['zip_code'])
    expect(returned_zip['lat']).to eq(expected_zipcode['lat'])
    expect(returned_zip['lng']).to eq(expected_zipcode['lng'])
  end
end
