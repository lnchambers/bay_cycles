require "rails_helper"

describe "As an admin" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe "when I visit the admin/dashboard" do
    it "I can see a link to view all accessories" do
      visit admin_dashboard_path

      click_on "View Accessories"

      expect(current_path).to eq("/admin/bike-shop")
    end
  end
end
