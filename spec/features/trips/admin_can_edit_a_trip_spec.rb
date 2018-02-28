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

  describe "when I visit the trips show page and click edit and fill in form" do
    it "I am redirected to the trip's show page and see trip's updated info" do
      visit trip_path(@trip)
      click_on "Edit"
      fill_in "Duration", with: "100"
      click_on "Update"

      expect(current_path).to eq(trip_path(@trip))
      expect(page).to have_content("100")
      expect(page).to have_content("Trip ID#{@trip.id} updated")
    end
  end
end
