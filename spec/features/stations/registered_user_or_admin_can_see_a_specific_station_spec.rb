require "rails_helper"

describe "As a registered User or Admin" do
  before :each do
    @admin = create(:admin)
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
    @trip_3 = create(:trip,
                    start_date: "2017-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station.id,
                    end_station_id: @station_2.id,
                    zip_code: 80920
                    )
    @trip_4 = create(:trip,
                    start_date: "2017-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station_2.id,
                    end_station_id: @station.id,
                    zip_code: 80920
                    )
    @trip_5 = create(:trip,
                    start_date: "2018-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station_2.id,
                    end_station_id: @station.id,
                    zip_code: 80920
                    )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the stations/:id page" do

    it "I can see the number of rides starting at this station" do
      visit station_path(@station)

      expect(page).to have_content("Total Rides Started Here: 3")
    end

    it "I can see the number of rides ending at this station" do
      visit station_path(@station)

      expect(page).to have_content("Total Rides Ended Here: 3")
    end

    it "I can see the most frequent destination for rides starting at this station" do
      visit station_path(@station)

      expect(page).to have_content("Most Frequent Destination: #{@station_2.name}")
    end

    it "I can see the most frequent origination for rides starting at this station" do
      visit station_path(@station)

      expect(page).to have_content("Most Frequent Origination: #{@station_2.name}")
    end

    it "I can see the date with the highest number of trips from this station" do
      visit station_path(@station)

      expect(page).to have_content("Date with Highest Number of Trips: 2017-06-19")
    end

    it "I can see the most frequent zip code for users for trips from this station" do
      visit station_path(@station)

      expect(page).to have_content("Most Common User Zip Code: 80920")
    end
  end
end
