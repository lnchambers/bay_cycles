require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit stations/new" do
    it "I can create a new station" do
      visit new_station_path

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[city]", with: "Um, Bay area?"
      fill_in "station[installation_date]", with: Time.now
      click_on "Create Station"

      expect(current_path).to eq("/stations/opakawagalaga")
      expect(page).to have_content("Name: Opakawagalaga")
    end

    it "I can see a flash message for success" do
      visit new_station_path

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[city]", with: "Um, Bay area?"
      fill_in "station[installation_date]", with: Time.now
      click_on "Create Station"

      expect(page).to have_content("Station created")
    end

    it "I can see a flash message for errors" do
      visit new_station_path

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[installation_date]", with: Time.now
      click_on "Create Station"

      expect(page).to have_content("Station not created. Try again.")
    end
  end
end
