require "rails_helper"

describe "As a registered User" do
  before :each do
    @user = create(:user)
    @order = create(:order, user: @user)
    @accessory = create(:accessory)
    @accessory_2 = create(:accessory)
    OrderedAccessory.create!(order: @order, accessory: @accessory, quantity: 4)
    OrderedAccessory.create!(order: @order, accessory: @accessory_2, quantity: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit order_path(@order)
  end
  describe "when I visit the /dashboard path" do
    it "I can click on one of my orders" do
      visit dashboard_path

      click_on "Order ##{@order.id}"

      expect(current_path).to eq(order_path(@order))
    end

    it "I can see a list of accessories I ordered broken down by subtotal and quantity" do
      expect(page).to have_content("Quantity: 4")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: $40,000")
      expect(page).to have_content("Subtotal: $20,000")
    end

    it "I see the total for this order" do
      expect(page).to have_content("Total Cost: $60,000")
    end

    it "I can see the order status" do
      expect(page).to have_content("Status: Ordered")
    end
  end
end
