require "rails_helper"

describe "As a registered User" do
  describe "when I visit the root path" do
    it "I can click on Login and login to my account" do
      admin = create(:admin)
      visit root_path

      click_on "Login"

      fill_in "email", with: admin.email
      fill_in "password", with: admin.password

      click_on "Submit"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Welcome, oh Mighty #{admin.name}. Your realm awaits.")
      expect(page).to have_content("Logged in as #{admin.name}")
      expect(page).to have_content("Current Email: #{admin.email}")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
