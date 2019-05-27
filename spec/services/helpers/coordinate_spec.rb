require 'rails_helper'

describe Coordinate do
  before :each do
    @positive_coordinate = Coordinate.new(45)
    @negative_coordinate = Coordinate.new(-30)
  end

  describe "formatting instance methods" do
    it "should return an expected latitude" do
      expect(@positive_coordinate.latitude).to eq("45_N")
      expect(@negative_coordinate.latitude).to eq("30_S")
    end

    it "should return an expected longitude" do
      expect(@positive_coordinate.longitude).to eq("45_E")
      expect(@negative_coordinate.longitude).to eq("30_W")
    end
  end
end
