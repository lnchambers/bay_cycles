require "rails_helper"

describe "As a Visitor" do
  before :all do
    @accessory = create(:accessory, role: 1)
  end
  describe "when I visit the accessory/show page for a retired accessory" do
    it "I can still access the page" do
      visit bike_shop_accessory_path(@accessory)

      expect(page).to have_content(@accessory.name)
    end

    it "I am not able to add the accessory to the cart" do
      visit bike_shop_accessory_path(@accessory)

      expect(page).to_not have_content("Add to Cart")
      expect(page).to have_content("Accessory Retired")
    end
  end
end
