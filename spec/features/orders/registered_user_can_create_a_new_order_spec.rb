require "rails_helper"

describe "As a registered User" do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @accessory = create(:accessory)
    visit bike_shop_path

    click_on "Add to Cart"
    click_on "Add to Cart"
    click_on "Add to Cart"
    click_on "Cart(3)"
  end
  describe "when I visit /cart" do
    it "I can create an order" do
      click_on "Checkout"

      fill_in "order[purchaser_name]", with: "Opakawagalaga"
      fill_in "order[purchaser_address]", with: "123 Eupanifahorious Way"
      click_on "Submit Order"

      expect(page).to have_content("You have successfully submitted your order!")
      expect(current_path).to eq(dashboard_path(@user))
      expect(Order.count).to eq(1)
      expect(OrderedAccessory.count).to eq(1)
    end
  end
end
