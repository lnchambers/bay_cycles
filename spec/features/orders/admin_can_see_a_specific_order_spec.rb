require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @order = create(:order)
    @accessory = create(:accessory)
    OrderedAccessory.create!(order: @order, accessory: @accessory, quantity: 4)
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
    end
  end
end
