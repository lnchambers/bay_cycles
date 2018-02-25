require "rails_helper"

describe "As an admin" do
  before :each do
    @admin = create(:admin)
    @accessory_active = create(:accessory)
    @accessory_inactive = create(:accessory, name: "I don't work", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

  end
  describe "when I visit the admin/dashboard" do

    it "I can see a link to view all accessories" do
      visit admin_dashboard_path

      click_on "View Accessories"

      expect(current_path).to eq("/admin/bike-shop")
    end

    it "I can see a table with all accessories" do
      visit admin_bike_shop_path

      expect(page).to have_content("Active Accessories: #{@accessory_active.name}")
      expect(page).to have_content("Inactive Accessories: #{@accessory_inactive.name}")
    end
  end
end
