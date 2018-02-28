require "rails_helper"

describe "As a Visitor" do
  before :each do
    @accessory_1 = create(:accessory)
    @accessory_2 = create(:accessory, name: "Small Hoops")
  end

  describe "when I visit /bike-shop" do
    it "I can click add to cart for an item" do
      visit bike_shop_path

      first(".accessory-card").click_on "Add to Cart"

      expect(current_path).to eq(bike_shop_path)
      expect(page).to have_content("Successfully added Big Hoops")
    end

    it "my cart count has increased to 1" do
      visit bike_shop_path

      first(".accessory-card").click_on "Add to Cart"

      expect(page).to have_content("Cart(1)")

      first(".accessory-card").click_on "Add to Cart"

      expect(page).to have_content("Cart(2)")
    end

    it "my cart count has increased to 1" do
      visit bike_shop_path

      first(".accessory-card").click_on "Add to Cart"
      click_on "Cart(1)"

      expect(current_path).to eq(cart_index_path)
      expect(page).to have_content(@accessory_1.name)
      expect(page).to have_content(@accessory_1.description)
      expect(page).to have_content("Price: $10,000")
      expect(page).to have_content("Quantity: 1")
      expect(page).to_not have_content(@accessory_2.name)
    end
  end

  describe "when I visit cart page" do
    describe "I increase the quantity of an item" do
      it "I see item's quantity go up" do
        visit bike_shop_path
        first(".accessory-card").click_on "Add to Cart"
        visit cart_index_path

        expect(page).to have_content("Cart(1)")
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("Subtotal: $10,000")

        click_on "Increase Quantity"

        expect(current_path).to eq(cart_index_path)
        expect(page).to have_content("Cart(2)")
        expect(page).to have_content("Quantity: 2")
        expect(page).to have_content("Subtotal: $20,000")
      end
    end
  end
end
