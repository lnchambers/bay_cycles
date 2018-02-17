require "rails_helper"

describe "As a Visitor" do
  before :each do
    @station = create(:station)
  end
  describe "When I visit the stations index" do
    it "I see all stations names" do
      visit stations_path

      expect(page).to have_content(@station.name)
    end

    it "I see all stations names" do
      visit stations_path

      expect(page).to have_content(@station.dock_count)
    end

    it "I see all stations names" do
      visit stations_path

      expect(page).to have_content(@station.city)
    end

    it "I see all stations names" do
      visit stations_path

      expect(page).to have_content(@station.installation_date)
    end
  end
end
