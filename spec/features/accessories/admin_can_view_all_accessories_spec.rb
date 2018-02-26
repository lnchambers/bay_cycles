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

      expect(page).to have_content("Name: #{@accessory_active.name}")
      expect(page).to have_content("Name: #{@accessory_inactive.name}")
    end

    it "I can see all the attributes of accessories" do
      visit admin_bike_shop_path

      expect(page).to have_content("Description: #{@accessory_active.description}")
      expect(page).to have_content("Description: #{@accessory_inactive.description}")
      expect(page).to have_content("Price: $10,000.00")
    end

    it "I can edit any accessory" do
      visit admin_bike_shop_path

      click_on "Edit #{@accessory_active.name}"

      fill_in "accessory[name]", with: "Opakawagalaga fine fabrics"
      click_on "Update Accessory"

      expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content("Accessory updated")
      expect(page).to have_content("Name: Opakawagalaga fine fabrics")
    end

    it "I can retire an accessory" do
      visit admin_bike_shop_path

      click_on "Retire Accessory"

      expect(page).to_not have_content("Status: Active")
    end

    it "I can reactive an accessory" do
      visit admin_bike_shop_path

      click_on "Reactivate Accessory"

      expect(page).to_not have_content("Status: Inactive")
    end
  end
end
