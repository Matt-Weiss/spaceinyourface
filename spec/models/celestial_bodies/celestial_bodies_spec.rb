require 'rails_helper'

describe CelestialBodies, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }

  end
end
