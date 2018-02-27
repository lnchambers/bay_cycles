require "rails_helper"

describe "As an Admin" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @order = create(:order)
    @accessory = create(:accessory)
    OrderedAccessories.create!(order_id: @order.id, accessory_id: @accessory.id, quantity: 4)
  end
  describe "when I visit the admin/order/:id page" do
    it "I can see the order's date and time" do
      visit admin_order_path(@order)

      expect(page).to have_content(@order.updated_at)
    end
  end
end
