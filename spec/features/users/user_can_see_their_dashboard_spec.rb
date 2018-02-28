require "rails_helper"

describe "As a registered User" do
  before :each do
    @user = create(:user)
    @order = create(:order, user: @user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "when I visit the /dashboard path" do
    it "I can click on one of my orders" do
      visit dashboard_path

      click_on "Order ##{@order.id}"

      expect(current_path).to eq(order_path(@order))
    end
  end
end
