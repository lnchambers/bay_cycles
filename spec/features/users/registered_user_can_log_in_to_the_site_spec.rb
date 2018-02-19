require "rails_helper"

describe "As a registered User" do
  describe "when I visit the root path" do
    it "I can click on Login and login to my account" do
      user = create(:user)
      visit root_path

      click_on "Login"

      fill_in "email", with: user.email
      fill_in "password", with: user.password

      click_on "Submit"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{user.name}!")
      expect(page).to have_content("Logged in as #{user.name}")
      expect(page).to have_content("Current Email: #{user.email}")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
