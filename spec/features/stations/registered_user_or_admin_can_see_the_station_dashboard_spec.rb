require "rails_helper"

describe "As a registered user or admin" do
  before :each do
    @admin = create(:admin)
    @user = create(:user)
    @station = create(:station)
    @station_2 = Station.create!(name: "Opakawagalaga Central", dock_count: 3, city: "Bay. Area.", installation_date: "2018-02-17 12:41:39")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the stations-dashboard page" do

    it "I can see the total count of stations" do
      visit station_dashboard_path

      expect(page).to have_content("Total Stations: 2")
    end

    it "I can see the average count of bikes at that station" do
      visit station_dashboard_path

      expect(page).to have_content("Average Count of Bikes: 2")
    end

    it "I can see the most bikes available at a station and the station name" do
      visit station_dashboard_path

      expect(page).to have_content("Most Bikes Available: 3 at #{@station_2.name}")
    end

    it "I can see the fewest bikes available at a station and the station name" do
      visit station_dashboard_path

      expect(page).to have_content("Fewest Bikes Avalailable: 1 at #{@station.name}")
    end

    it "I can see the oldest station" do
      visit station_dashboard_path

      expect(page).to have_content("Oldest Station: #{@station.name}")
    end

    it "I can see the newest station" do
      visit station_dashboard_path

      expect(page).to have_content("Newest Station: #{@station_2.name}")
    end
  end
end
