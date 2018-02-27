require 'rails_helper'

describe "As an Admin" do
  before :all do
    @station = create(:station)
    @condition = create(:condition, date: Date.new(2018,2,26))
  end
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe "when I visit the trips new page and fill in form with all attributes" do
    it "I am redirected to the trip's show page and see trip's updated info" do
      visit new_admin_trip_path
      fill_in "trip[duration]", with: "100"
      fill_in "trip[start_date]", with: DateTime.new(2018,2,26,1,2)
      fill_in "trip[start_station_id]", with: "1"
      fill_in "trip[end_date]", with: DateTime.new(2018,2,26,1,4)
      fill_in "trip[end_station_id]", with: "1"
      fill_in "trip[bike_id]", with: "2"
      fill_in "trip[subscription_type]", with: "rider"
      fill_in "trip[zip_code]", with: "60608"
      click_on "Create"

      expect(current_path).to eq(trip_path(Trip.last))
      expect(page).to have_content("100")
      expect(page).to have_content("Trip created")
    end
  end

    describe "when I visit the trips new page and fill in form with all but one attribute" do
      it "I see a flash message for errors" do
        visit new_admin_trip_path
        fill_in "trip[duration]", with: "100"
        fill_in "trip[start_date]", with: DateTime.new(2018,2,26,1,2)
        fill_in "trip[start_station_id]", with: "1"
        fill_in "trip[end_date]", with: DateTime.new(2018,2,26,1,4)
        fill_in "trip[bike_id]", with: "2"
        fill_in "trip[subscription_type]", with: "rider"
        fill_in "trip[zip_code]", with: "60608"
        click_on "Create"

        expect(page).to have_content("Trip not created. Try again.")
      end
    end
end
