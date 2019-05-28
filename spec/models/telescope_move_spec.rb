require 'rails_helper'

describe 'telescope_move PORO' do
  describe 'instance methods' do
    before :each do
      ephemeris_data = {
        "data": {
          "latitude": "39.737 N",
          "longitude": "-104.989 E",
          "start_time": "2019-05-26 22:41:24",
          "end_time": "2019-05-26 23:41:24",
          "celestial_body": "luna",
          "start_dec": "-12.707162072642532",
          "start_ra": "22.707239212881557",
          "end_dec": "-12.528352525910414",
          "end_ra": "22.7489903630627"
        }
      }
      @motor = TelescopeMove.new(ephemeris_data)
    end

    it 'dec_delta' do
      expect(@motor.dec_delta).to be_within(10**-7).of(0.178809546732118)
    end

    it 'ra_delta' do
      expect(@motor.ra_delta).to be_within(10**-7).of(0.041751150181143)
    end

    it 'move_to_start_dec' do
      expect(@motor.move_to_start_dec).to eq(381)
      expect(@motor.total_steps[:dec_steps]).to eq(381)
    end

    it 'move_to_start_ra' do
      expect(@motor.move_to_start_ra).to eq(27248)
      expect(@motor.total_steps[:ra_steps]).to eq(27248)
    end

    it 'track_dec_steps' do
      expect(@motor.track_dec_steps).to eq(5)
    end

    it 'track_ra_steps' do
      expect(@motor.track_ra_steps).to eq(50)
    end

    it 'track_dec_delay' do
      expect(@motor.track_dec_delay).to eq(720000)
    end

  end
end
