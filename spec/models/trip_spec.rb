require 'rails_helper'

describe Trip, type: :model do
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:bike_id) }
  it { should validate_presence_of(:subscription_type) }
  it { should validate_presence_of(:zip_code) }

  describe "relationships" do
    it { is_expected.to belong_to(:start_station) }
    it { is_expected.to belong_to(:end_station) }
  end

  describe "class methods" do
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

    describe ".average_duration" do
      it "returns average duration of all trips" do
        trips = [@trip_1.duration, @trip_2.duration, @trip_3.duration]

        expect(Trip.average_duration).to eq((trips.sum / trips.size)/60)
      end
    end

    describe ".shortest_ride" do
      it "returns average duration of all trips" do

        expect(Trip.shortest_ride).to eq(@trip_1.duration/60)
      end
    end

    describe ".longest_ride" do
      it "returns average duration of all trips" do

        expect(Trip.longest_ride).to eq(@trip_3.duration/60)
      end
    end

    describe ".start_station_most_rides" do
      it "returns station with the most rides as a starting place" do

        expect(Trip.start_station_most_rides.start_station_id).to eq(@station_1.id)
      end
    end

    describe ".end_station_most_rides" do
      it "returns station with the most rides as an ending place" do

        expect(Trip.end_station_most_rides.end_station_id).to eq(@station_3.id)
      end
    end

    describe ".most_ridden_bike" do
      it "returns most ridden bike" do
        expect(Trip.most_ridden_bike.bike_id).to eq(1)
        expect(Trip.most_ridden_bike.count).to eq(2)
      end
    end

    describe ".least_ridden_bike" do
      it "returns least ridden bike" do
        expect(Trip.least_ridden_bike.bike_id).to eq(2)
        expect(Trip.least_ridden_bike.count).to eq(1)
      end
    end

    describe ".subscription_type_breakout" do
      it "returns user subscription type breakout with both count and percentage" do
        expect(Trip.subscription_type_breakout.first.subscription_type).to eq("Subscriber")
        expect(Trip.subscription_type_breakout.first.count).to eq(2)
        expect(Trip.subscription_type_percentage_first).to eq(66.7)
        expect(Trip.subscription_type_breakout.last.subscription_type).to eq("Customer")
        expect(Trip.subscription_type_breakout.last.count).to eq(1)
        expect(Trip.subscription_type_percentage_last).to eq(33.3)
      end
    end

    describe ".most_popular_ride_date" do
      it "returns single date with the highest number of trips and count of those trips" do
        expect(Trip.most_popular_ride_date.start_date.to_date.to_s).to eq("2018-06-19")
        expect(Trip.most_popular_ride_date.count).to eq(2)
      end
    end

    describe ".least_popular_ride_date" do
      it "returns single date with the lowest number of trips and count of those trips" do
        expect(Trip.least_popular_ride_date.start_date.to_date.to_s).to eq("2018-02-19")
        expect(Trip.least_popular_ride_date.count).to eq(1)
      end
    end
  end
end
