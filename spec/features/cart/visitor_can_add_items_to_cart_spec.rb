require "rails_helper"

describe "As a Visitor" do
  before :each do
    @accessory_1 = create(:accessory)
    @accessory_2 = create(:accessory, name: "Small Hoops")
    Cart.new({"1" => 1})
  end

  describe "when I visit /bike-shop" do
    it "my cart count has increased to 1" do
      visit bike_shop_path

      within ".accessory#{@accessory_1.id}" do
        click_on "Add to Cart"
      end
      click_on "Cart(1)"

      expect(current_path).to eq(carts_path)
      expect(page).to have_content(@accessory_1.name)
      expect(page).to have_content(@accessory_1.description)
      expect(page).to have_content(@accessory_1.price)
      expect(page).to_not have_content(@accessory_2.name)
    end

    it "I can click add to cart for an item" do
      visit bike_shop_path

      within ".accessory#{@accessory_1.id}" do
        click_on "Add to Cart"
      end

      expect(current_path).to eq(bike_shop_path)
      expect(page).to have_content("Successfully added item")
    end

    it "my cart count has increased to 1" do
      visit bike_shop_path

      within ".accessory#{@accessory_1.id}" do
        click_on "Add to Cart"
      end

      expect(page).to have_content("Cart(1)")

      within ".accessory#{@accessory_1.id}" do
        click_on "Add to Cart"
      end

      expect(page).to have_content("Cart(2)")
    end
  end
end
