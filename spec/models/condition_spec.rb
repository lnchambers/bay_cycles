require 'rails_helper'

describe Condition, type: :model do
  it { should validate_presence_of(:date)}
  it { should validate_presence_of(:max_temperature)}
  it { should validate_presence_of(:mean_temperature)}
  it { should validate_presence_of(:min_temperature)}
  it { should validate_presence_of(:mean_humidity)}
  it { should validate_presence_of(:mean_visibility)}
  it { should validate_presence_of(:mean_wind_speed)}
  it { should validate_presence_of(:precipitation)}
end

describe "class methods" do
  before :all do
    @station_1 = create(:station)
    @station_2 = create(:station)
    @station_3 = create(:station)
    @condition_1 = create(:condition, date: "2018-03-19", max_temperature: 50)
    @condition_2 = create(:condition, date: "2018-04-19", max_temperature: 55)
    @condition_3 = create(:condition, date: "2018-05-19", max_temperature: 61)
    @condition_4 = create(:condition, date: "2018-06-19", max_temperature: 66)
    @condition_5 = create(:condition, date: "2018-07-19", max_temperature: 75)
    @trip_1 = create(:trip, condition: @condition_1)
    @trip_2 = create(:trip, condition: @condition_2)
    @trip_3 = create(:trip, condition: @condition_2)
    @trip_4 = create(:trip, condition: @condition_3)
    @trip_5 = create(:trip, condition: @condition_3)
    @trip_6 = create(:trip, condition: @condition_4)
    @trip_7 = create(:trip, condition: @condition_4)
    @trip_8 = create(:trip, condition: @condition_4)
    @trip_9 = create(:trip, condition: @condition_5)
    @trip_10 = create(:trip, condition: @condition_5)
    @trip_11 = create(:trip, condition: @condition_5)
    @trip_12 = create(:trip, condition: @condition_5)
  end

  describe ".temp_ranges" do
    it "should return the breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks" do
      range = [50, 59.99]

      expect(Condition.average_rides_for_temps(range)).to eq(1.5)
    end
  end
end
