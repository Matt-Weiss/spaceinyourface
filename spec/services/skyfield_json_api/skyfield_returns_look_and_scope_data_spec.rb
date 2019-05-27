require 'rails_helper'

describe 'Skyfield Service' do
  it 'should should be able to recieve expected data from api call' do
    json_skyfield_data = File.open('./spec/fixtures/skyfield_data.json')
    stub_request(:get, "https://skyfield-json.herokuapp.com/ephemerides?bodies=mercury,luna,&latitude=41.345&longitude=-41.112")
      .to_return(status: 200, body: json_skyfield_data)
    # stub_request(:get, "https://skyfield-json.herokuapp.com/ephemerides?longitude=-41.112&latitude=41.345_N&bodies=mercury,luna")

      coordinates = [-41.112, 41.345]
      bodies = ["mercury", "luna"]

    expected = SkyfieldService.new(coordinates, bodies).body_data

    expect(expected['data']['latitude']).to eq('41.345 N')
    expect(expected['data']['longitude']).to eq('41.112 W')
    expect(expected['data']['celestial_bodies'][0]['name']).to eq('mercury')
    expect(expected['data']['celestial_bodies'][0]['name']).to eq('mercury')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['ra']).to eq('4.695715462226076')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['dec']).to eq('23.454027163061795')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['az']).to eq('355.9271999168067')
    expect(expected['data']['celestial_bodies'][0]['decimal_attributes']['el']).to eq('-25.059243299469802')
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['ra']).to eq("04h 41m 44.58s")
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['dec']).to eq("+23deg 27' 14.5\"")
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['az']).to eq("355deg 55' 37.9\"")
    expect(expected['data']['celestial_bodies'][0]['strf_attributes']['el']).to eq("-25deg 03' 33.3\"")
    expect(expected['data']['celestial_bodies'][1]['name']).to eq('luna')
  end
end
