require "rails_helper"

describe "As a visitor" do
  describe "when I visit the root path" do
    it "I can click a link to log in" do
      visit root_path

      click_on "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Create Account")
    end

    it "I can click on create account" do
      visit login_path

      click_on "Create Account"

      expect(current_path).to eq(new_user_path)
    end

    it "I can create an account on the new user page" do
      visit new_user_path

      fill_in "user[name]", with: "Opakawagalaga"
      fill_in "user[email]", with: "opakawagalaga@eupanifahorious.com"
      fill_in "user[password]", with: "mahstrongpassword"
      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, Opakawagalaga!")
      expect(page).to have_content("Logged in as Opakawagalaga")
      expect(page).to have_content("Current Email: opakawagalaga@eupanifahorious.com")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
