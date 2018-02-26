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
    it "I can see a small image, name, description, and price for each accessory in my cart" do
      expect(page).to have_content(@accessory.name)
      expect(page).to have_content(@accessory.description)
      expect(page).to have_content("$10,000")
    end

    it "I can see a subtotal and quantity breakdown for each accessory" do
      expect(page).to have_content("Subtotal: $30,000")
      expect(page).to have_content("Quantity: 3")
    end

    it "I can see a total my cart" do
      expect(page).to have_content("Total: $30,000")
    end

    it "I see a button for checkout" do
      click_on "Checkout"

      expect(current_path).to eq(dashboard_path(@user))
      expect(page).to have_content("You have successfully submitted your order")
    end
  end
end
