require "rails_helper"

describe "As an Admin" do
  describe "when I visit the admin/accessories/new path" do
    it "I can create a new accessory" do
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_bike_shop_new_path

      fill_in "accessory[name]", with: "Opakawagalaga Fine Chains"
      fill_in "accessory[description]", with: "2Chainz"
      fill_in "accessory[price]", with: 10
      click_on "Create Accessory"

      expect(page).to have_content("Name: Opakawagalaga Fine Chains")
      expect(page).to have_content("Description: 2Chainz")
      expect(page).to have_content("Price: $10.00")
    end
  end
end
