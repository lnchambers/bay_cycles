require "rails_helper"

describe "As an admin" do
  describe "when I visit the admin/dashboard" do
    it "I can see a link to view all accessories" do
      visit admin_dashboard_path

      click_on "View Accessories"

      expect(current_path).to eq("/admin/bike-shop")
