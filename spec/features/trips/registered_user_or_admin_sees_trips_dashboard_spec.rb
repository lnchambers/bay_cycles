require 'rails_helper'

describe "As a registered User or Admin" do
  before :all do
    @station_1 = create(:station)
    @station_2 = create(:station)
    @station_3 = create(:station)
    @trip_1 = create(:trip,
                    start_station_id: @station_1.id,
                    end_station_id: @station_2.id
                    )
    @trip_2 = create(:trip,
                    start_date: "2018-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station_1.id,
                    end_station_id: @station_3.id
                    )
    @trip_3 = create(:trip,
                    start_date: "2018-06-19 12:27:55",
                    end_date: "2018-06-19 12:27:55",
                    start_station_id: @station_2.id,
                    end_station_id: @station_3.id,
                    bike_id: 2,
                    subscription_type: "Customer"
                  )
  end
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit trips_dashboard_path
  end

  describe "when I visit /trips-dashboard" do
    it "I see average duration of a ride" do
      trips = [@trip_1.duration, @trip_2.duration, @trip_3.duration]

      expect(page).to have_content((trips.sum / trips.size)/60)
    end

    it "I see the shortest ride" do
      expect(page).to have_content(@trip_1.duration/60)
    end

    it "I see the longest ride" do
      expect(page).to have_content(@trip_3.duration/60)
    end

    it "I see the station with the most rides as a starting place" do
      expect(page).to have_content(@trip_1.id)
    end

    it "I see the station with the most rides as an ending place" do
      expect(page).to have_content(@trip_3.id)
    end

    it "I see month by month breakdown of number of rides with subtotals for each year" do
      expect(page).to have_content(6)
      expect(page).to have_content(2)
    end

    it "I see most ridden bike with total number of rides for that bike" do
      expect(page).to have_content(1)
      expect(page).to have_content(2)
    end

    it "I see least ridden bike with total number of rides for that bike" do
      expect(page).to have_content(2)
      expect(page).to have_content(1)
    end

    it "I see user subscription type breakout with both count and percentage" do
      expect(page).to have_content("Subscriber")
      expect(page).to have_content(2)
      expect(page).to have_content("Customer")
      expect(page).to have_content(1)
    end

    it "I see a single date with the highest number of trips with a count of those trips" do
      expect(page).to have_content("2018-06-19")
      expect(page).to have_content(2)
    end

    it "I see a single date with the lowest number of trips with a count of those trips" do
      expect(page).to have_content("2018-02-19")
      expect(page).to have_content(1)
    end
  end
end
