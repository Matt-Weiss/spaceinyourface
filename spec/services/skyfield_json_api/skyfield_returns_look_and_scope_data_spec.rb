require 'rails_helper'

describe 'Skyfield Service' do
  it 'should should be able to recieve expected data from api call' do
    json_skyfield_data = File.open('./spec/fixtures/skyfield_data.json')

    stub_request(:get, "https://skyfield-json.herokuapp.com/ephemerides?longitude=-41.112&latitude=41.345_N&bodies=mercury,luna")
      .to_return(status: 200, body: json_skyfield_data)

      coordinates = [-41.112, 41.345]
      bodies = ["mercury", "luna"]

    expected = SkyfieldService.new(coordinates, bodies)

    expect(expected['data']['latitude']).to eq('41.345 N')
    expect(expected['data']['longitude']).to eq('41.112 W')
    expect(expected['data']['celestial_bodies'][0]['name']).to eq('mercury')
    expect(expected['data']['celestial_bodies'][0]['name']).to eq('mercury')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['ra']).to eq('4.695715462226076')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['dec']).to eq('23.454027163061795')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['az']).to eq('355.9271999168067')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['el']).to eq('-25.059243299469802')
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['ra']).to eq('22h 55m 05.87s')
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['dec']).to eq("-12deg 08' 51.4\"")
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['az']).to eq("94deg 22' 51.5\"")
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['el']).to eq("-13deg 22' 57.7\"")
    expect(expected['data']['celestial_bodies'][1]['name']).to eq('luna')
  end
end

{"data": {"latitude": "41.345 N", "longitude": "41.112 W", "time": "2019-05-27 02:53:44", "celestial_bodies": [{"name": "mercury", "decimal_attributes": {"ra": "4.695715462226076", "dec": "23.454027163061795", "az": "355.9271999168067", "el": "-25.059243299469802"}, "strf_attributes": {"ra": "04h 41m 44.58s", "dec": "+23deg 27' 14.5\"", "az": "355deg 55' 37.9\"", "el": "-25deg 03' 33.3\""}}, {"name": "luna", "decimal_attributes": {"ra": "22.91829777579635", "dec": "-12.147624918658204", "az": "94.38096623970408", "el": "-13.382684491493697"}, "strf_attributes": {"ra": "22h 55m 05.87s", "dec": "-12deg 08' 51.4\"", "az": "94deg 22' 51.5\"", "el": "-13deg 22' 57.7\""}}]}}
