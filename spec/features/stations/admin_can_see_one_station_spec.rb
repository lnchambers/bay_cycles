require "rails_helper"

describe "As an Admin" do
  before :all do
    @admin = create(:admin)
    @station = create(:station)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the station show page" do
    it "I can see all the attributes" do
      visit station_path(@station)

      expect(page).to have_content(@station.name)
      expect(page).to have_content(@station.dock_count)
      expect(page).to have_content(@station.city)
      expect(page).to have_content(@station.installation_date)
    end

    it "I can see the edit and delete buttons" do
      visit station_path(@station)

      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end

    it "the edit button is functional" do
      visit station_path(@station)

      click_on "Edit"

      expect(current_path).to eq(edit_admin_station_path(@station))
    end

    it "the delete button is functional" do
      visit station_path(@station)

      click_on "Delete"

      expect(current_path).to eq(stations_path)
      expect(page).to have_content("Station deleted =(")
      expect(page).to_not have_content(@station.name)
    end
  end
end
