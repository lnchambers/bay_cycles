require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @order = create(:order)
    @accessory = create(:accessory)
    @accessory_2 = create(:accessory)
    OrderedAccessory.create!(order: @order, accessory: @accessory, quantity: 4)
    OrderedAccessory.create!(order: @order, accessory: @accessory_2, quantity: 2)
    visit admin_order_path(@order)
  end
  describe "when I visit the admin/order/:id page" do
    it "I can see the order's date and time" do
      expect(page).to have_content(@order.updated_at)
    end

    it "I can see the purchaser's name and address" do
      expect(page).to have_content(@order.purchaser_name)
      expect(page).to have_content(@order.purchaser_address)
    end

    it "I can see the accessories ordered" do
      expect(page).to have_content(@accessory.name)
      expect(page).to have_content(@accessory_2.name)
    end

    it "I can see the total quantity of an accessory ordered" do
      expect(page).to have_content("Quantity: 4")
      expect(page).to have_content("Quantity: 2")
    end

    it "I see the line item subtotal" do
      expect(page).to have_content("Line Item Subtotal: $40,000")
      expect(page).to have_content("Line Item Subtotal: $20,000")
    end

    it "I also see the total for the order" do
      expect(page).to have_content("Total Cost: $60,000")
    end
  end
end
