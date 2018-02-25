require "rails_helper"

describe "As a Visitor" do
  before :all do
    @station = create(:station)
    @station_2 = create(:station)
    @trip = create(:trip,
                    start_station_id: @station.id,
                    end_station_id: @station.id
                    )
    @trip_2 = create(:trip,
                    start_date: "2017-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station.id,
                    end_station_id: @station_2.id,
                    zip_code: 80920
                    )
  end
  describe "when I visit the stations/:id page" do
    it "I can see basic information about the station" do
      visit station_path(@station)

      expect(page).to have_content("Name: #{@station.name}")
    end

    it "but I cannot see the analytics" do
      visit station_path(@station)

      expect(page).to_not have_content("Total Rides Started Here: 2")
    end
  end
end
