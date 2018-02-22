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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "when I visit /trips-dashboard" do
    it "I see ..." do
      
    end
  end
end
