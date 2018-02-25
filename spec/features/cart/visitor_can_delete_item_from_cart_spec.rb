require 'rails_helper'

describe "As a visitor" do
  before :each do
    @accessory_1 = create(:accessory)
    @accessory_2 = create(:accessory, name: "Small Hoops")

  end

  describe "when I visit the cart page" do
    describe "I click link Remove next to an accessory" do
      it "I do not see my accessory listed in my cart" do
        visit bike_shop_path

        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_2.id}" do
          click_on "Add to Cart"
        end

        visit carts_path

        expect(page).to have_content("Accessory: Big Hoops")
        expect(page).to have_content("Accessory: Small Hoops")

        click_on "Remove"

        expect(current_path).to eq(carts_path)
        expect(page).to_not have_content("Accessory: Big Hoops")
        expect(page).to have_content("Accessory: Small Hoops")
      end

      it "I see a flash telling me I have successfully removed item" do

        expect(page).to have_content("Successfully removed X from your cart.")
      end

      it "I can click undo on the flash message and item will be added back into my cart" do

      end
    end
  end
end
