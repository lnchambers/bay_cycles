require "rails_helper"

describe "As a visitor" do
  describe "when I visit the station show" do
    it "I see the url '/:station-name' with that station's name instead of :id" do
      station = create(:station)
      visit station_path(station)

      expect(current_path).to eq("/stations/eupanifahorious-bikes")
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)
    end
  end
end
