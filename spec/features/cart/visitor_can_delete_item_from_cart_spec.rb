require 'rails_helper'

describe "As a visitor" do
  before :each do
    @accessory_1 = create(:accessory)
    @accessory_2 = create(:accessory, name: "Small Hoops")
  end

  describe "when I visit the cart page" do
    describe "I click link Remove next to an accessory" do
      it "I do not see my accessory listed in my cart." do
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

        within ".accessory#{@accessory_1.id}" do
          click_on "Remove"
        end

        expect(current_path).to eq(carts_path)
        expect(page).to_not have_content("Accessory: Big Hoops")
        expect(page).to have_content("Accessory: Small Hoops")
      end

      it "I see a flash message telling me I have successfully removed item." do
        visit bike_shop_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_2.id}" do
          click_on "Add to Cart"
        end
        visit carts_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Remove"
        end

        expect(page).to have_content("Successfully removed Big Hoops from your cart.")
      end

      it "I can click undo on the flash message and item will be added back into my cart" do
        visit bike_shop_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_2.id}" do
          click_on "Add to Cart"
        end
        visit carts_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Remove"
        end
        click_on "Undo"

        expect(page).to have_content("Successfully added Big Hoops")
        expect(page).to have_content("Accessory: Big Hoops")
        expect(page).to have_content("Accessory: Small Hoops")
      end
    end

    describe "I decrease the quanity of an item" do
      it "I see the item's quantity go down" do
        visit bike_shop_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        visit carts_path

        expect(page).to have_content("Cart(3)")
        expect(page).to have_content("Quantity: 3")
        expect(page).to have_content("Subtotal: $30000")

        click_on "Decrease Quantity"

        expect(current_path).to eq(carts_path)
        expect(page).to have_content("Cart(2)")
        expect(page).to have_content("Quantity: 2")
        expect(page).to have_content("Subtotal: $20000")
      end
    end

    describe "I decrease the quanity of an item to 1" do
      it "I don't see the decrease button anymore" do
        visit bike_shop_path
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        within ".accessory#{@accessory_1.id}" do
          click_on "Add to Cart"
        end
        visit carts_path
        click_on "Decrease Quantity"

        expect(page).to have_button("Decrease Quantity")

        click_on "Decrease Quantity"

        expect(page).to_not have_button("Decrease Quantity")
      end
    end
  end
end
