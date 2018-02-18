require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    @station = create(:station)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit stations/:id/edit" do
    it "I can update a specific station" do
      visit edit_station_path(@station)

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[city]", with: "Um, Bay area?"
      fill_in "station[installation_date]", with: Time.now
      click_on "Update Station"

      expect(page).to have_content("Name: Opakawagalaga")
    end

    it "I can see a flash message for a success" do
      visit edit_station_path(@station)

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[city]", with: "Um, Bay area?"
      fill_in "station[installation_date]", with: Time.now
      click_on "Update Station"

      expect(page).to have_content("Station updated")
    end

    it "I can see a flash message for an error" do
      visit edit_station_path(@station)

      fill_in "station[name]", with: "Opakawagalaga"
      fill_in "station[dock_count]", with: "1"
      fill_in "station[city]", with: ""
      fill_in "station[installation_date]", with: Time.now
      click_on "Update Station"

      expect(page).to have_content("Station not updated. Try again.")
    end
  end
end
