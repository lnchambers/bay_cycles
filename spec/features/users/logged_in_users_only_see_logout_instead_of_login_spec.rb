require "rails_helper"

describe "As a registered user or admin" do
  describe "when I visit the root path" do
    it "I see the option to logout without seeing login" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path

      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
