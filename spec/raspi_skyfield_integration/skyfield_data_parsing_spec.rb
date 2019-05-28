require 'rails_helper'

describe 'from a planet show page' do
  describe 'as a user' do
    it 'moves the motors when I press "track"' do
      #track button hits TelescopeController create method
      #create method gets body and location params
      #method calls location API for lat/longitude
      #method then calls Skyfield API with that data
      #convert r.a. and declination into steps and delays for motor motion
      #hit '/scopetrack' on pi to activate motors
    end
  end
end
