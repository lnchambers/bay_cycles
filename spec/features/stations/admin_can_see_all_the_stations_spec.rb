require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    @station = create(:station)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the stations index page" do
    it "I can see everything a visitor can see" do
      visit stations_path

      expect(page).to have_content("Name: #{@station.name}")
      expect(page).to have_content("Dock Count: #{@station.dock_count}")
      expect(page).to have_content("City: #{@station.city}")
      expect(page).to have_content("Installation Date: #{@station.installation_date}")
    end

    it "I can also see a delete button" do
      visit stations_path

      expect(page).to have_content("Delete")
    end

    it "I can also see an edit button" do
      visit stations_path

      expect(page).to have_content("Edit")
    end
  end
end
