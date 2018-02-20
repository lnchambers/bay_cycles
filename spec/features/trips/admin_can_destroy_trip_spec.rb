require 'rails_helper'

describe "As an Admin" do
  before :all do
    @station = create(:station)
    @trip = create(:trip)
  end
  describe "when I visit trip index page" do
    it "I can delete a trip" do
      visit trips_path
      click_on "Delete"

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(@trip.id)
    end
  end

  describe "when I visit trip index page" do
    it "I can delete a trip" do
      visit trip_path(@trip)
    end
  end
end
