require 'rails_helper'

describe "As a registered User or Admin" do
  before :each do
    @station_1 = create(:station)
    @station_2 = create(:station)
    @condition_1 = create(:condition, date: "2018-03-19", max_temperature: 50, precipitation: 0, mean_wind_speed: 0, mean_visibility: 0)
    @condition_2 = create(:condition, date: "2018-04-19", max_temperature: 55, precipitation: 0.2, mean_wind_speed: 2, mean_visibility: 2)
    @condition_3 = create(:condition, date: "2018-05-19", max_temperature: 61, precipitation: 0.3, mean_wind_speed: 4, mean_visibility: 4)
    @condition_4 = create(:condition, date: "2018-06-19", max_temperature: 66, precipitation: 0.5, mean_wind_speed: 5, mean_visibility: 5)
    @condition_5 = create(:condition, date: "2018-07-19", max_temperature: 75, precipitation: 0.7, mean_wind_speed: 7.99, mean_visibility: 7.99)
    @station_3 = create(:station)
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

    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit trips_dashboard_path
  end

  describe "when I visit /trips-dashboard" do
    it "I see weather analytics" do
      visit weather_dashboard_path

      expect(page).to have_content("1.5")
      expect(page).to have_content("2")
      expect(page).to have_content("1")
      expect(page).to have_content("1.7")
      expect(page).to have_content("3.5")
      expect(page).to have_content("3")
      expect(page).to have_content("4")
    end
  end
end
