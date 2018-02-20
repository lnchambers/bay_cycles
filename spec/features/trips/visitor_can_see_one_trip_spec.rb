require 'rails_helper'

describe "As a visitor" do
  before :each do
    @station = create(:station)
    @trip = create(:trip)
  end
  describe "when I visit a trip show page" do
    it "I see all attributes for trip" do
      visit trip_path(@trip)
      save_and_open_page
      expect(page).to have_content(@trip.duration)
      expect(page).to have_content(@trip.start_date)
      expect(page).to have_content(@trip.start_station.name)
      expect(page).to have_content(@trip.end_date)
      expect(page).to have_content(@trip.end_station.name)
      expect(page).to have_content(@trip.bike_id)
      expect(page).to have_content(@trip.subscription_type)
      expect(page).to have_content(@trip.zip_code)
    end
  end
end
