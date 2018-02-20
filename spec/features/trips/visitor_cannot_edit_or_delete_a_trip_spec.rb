require "rails_helper"

describe "As a Visitor" do
  before :all do
    @station = create(:station)
    @trip = create(:trip)
  end

  describe "when I visit the trips index page" do
    it "I do not see edit or delete buttons next to each trip" do
      visit trips_path

      expect(page).to_not have_content("Delete")
      expect(page).to_not have_content("Edit")
    end
  end

  describe "when I try to visit trip/:id/edit" do
    it "I am redirected to a 404 page" do
      visit edit_trip_path(@trip)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end

  describe "when I try to visit trips/new" do
    it "I am redirected to a 404 page" do
      visit new_trip_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
