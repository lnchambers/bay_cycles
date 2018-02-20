require 'rails_helper'

describe "As an Admin" do
  before :all do
    @station = create(:station)
    @trip = create(:trip)
  end
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "when I visit trip index page" do
    it "I can delete a trip" do
      visit trips_path
      click_on "Delete"

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(@trip.id)
      expect(page).to have_content("Trip deleted")
    end
  end

  describe "when I visit trip show page" do
    it "I can delete a trip" do
      visit trip_path(@trip)
      click_on "Delete"

      expect(current_path).to eq(trips_path)
      expect(page).to_not have_content(@trip.id)
      expect(page).to have_content("Trip deleted")
    end
  end
end
