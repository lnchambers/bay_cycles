require "rails_helper"

describe "As a Visitor" do
  before :all do
    create(:accessory)
  end
  describe "when I visit /bike-shop" do
    it "I can click add to cart for an item" do
      visit bike_shop_path

      click_on "Add to Cart"

      expect(current_path).to eq(bike_shop_path)
      expect(page).to have_content("Successfully added item")
    end

    it "my cart count has increased to 1" do
      visit bike_shop_path

      click_on "Add to Cart"

      expect(page).to have_content("Cart(1)")

      click_on "Add to Cart"

      expect(page).to have_content("Cart(2)")
    end
  end
end