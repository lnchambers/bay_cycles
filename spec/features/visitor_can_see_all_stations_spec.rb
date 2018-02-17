require "rails_helper"

describe "As a Visitor" do
  before :each do
    @station = create(:station)
  end
  describe "When I visit the stations index" do
    it "I see all station's names" do
      visit stations_path

      expect(page).to have_content("Name: #{@station.name}")
    end

    it "I see all station's dock counts" do
      visit stations_path

      expect(page).to have_content("Dock Count: #{@station.dock_count}")
    end

    it "I see all station's cities" do
      visit stations_path

      expect(page).to have_content("City: #{@station.city}")
    end

    it "I see all station's installation date" do
      visit stations_path

      expect(page).to have_content("Installation Date: #{@station.installation_date}")
    end
  end
end
