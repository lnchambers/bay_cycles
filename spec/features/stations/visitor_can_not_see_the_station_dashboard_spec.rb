require "rails_helper"

describe "As a Visitor" do
  describe "when I visit the /station-dashboard path" do
    it "I get a 404 page" do
      visit stations_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
