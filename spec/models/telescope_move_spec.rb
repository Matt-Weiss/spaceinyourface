require 'rails_helper'

describe 'telescope_move PORO' do
  describe 'instance methods' do
    before :each do
      ephemeris_data = {"data" =>
                   {"latitude" => "39.7348 N",
                   "longitude" => "104.9653 W",
                  "start_time" => "2019-05-28 20:41:40",
                    "end_time" => "2019-05-28 21:41:40",
              "celestial_body" => "venus",
                   "start_dec" => "15.348037342090622",
                    "start_ra" => "2.9352524011268986",
                     "end_dec" => "15.363469874497973",
                      "end_ra" => "2.9385758993886246"}
                    }
      @motor = TelescopeMove.new(ephemeris_data)
    end

    it 'dec_delta' do
      expect(@motor.dec_delta).to be_within(10**-7).of(0.015432532407350763)
    end

    it 'ra_delta' do
      expect(@motor.ra_delta).to be_within(10**-7).of(0.0033234982617260656)
    end

    it 'move_to_start_dec' do
      expect(@motor.move_to_start_dec).to eq(2239)
      expect(@motor.total_steps['dec_steps']).to eq(2239)
    end

    it 'move_to_start_ra' do
      expect(@motor.move_to_start_ra).to eq(-3522)
      expect(@motor.total_steps['ra_steps']).to eq(-3522)
    end

    it 'track_dec_steps' do
      expect(@motor.track_dec_steps).to eq(1)
    end

    it 'track_ra_steps' do
      expect(@motor.track_ra_steps).to eq(4)
    end

    it 'track_dec_delay' do
      expect(@motor.track_dec_delay).to eq(3_600_000)
    end

    it 'track_ra_delay' do
      expect(@motor.track_ra_delay).to eq(900_000)
    end

  end
end
