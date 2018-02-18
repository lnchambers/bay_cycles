require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    @station = create(:station)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the stations index page" do
    it "I can delete a station" do
      visit stations_path

      click_on "Delete"

      expect(page).to have_content("Station deleted =(")
      expect(page).to_not have_content(@station.name)
    end
  end
end
