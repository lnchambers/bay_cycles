require 'rails_helper'

describe "As a visitor" do
  before :each do
    @station = create(:station)
    @trips = create_list(:trip, 60)
  end
  describe "when I visit trips index" do
    it "I see first 30 trips" do
      visit trips_path

      expect(page).to have_content(@trips[0..30].map {|trip| trip.duration})
    end
  end
end
