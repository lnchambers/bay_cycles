require "rails_helper"

describe "As a registered User or Admin" do
  before :all do
    @admin = create(:admin)
    @user = create(:user)
  end
  describe "when I visit the edit user path" do
    it "admin can edit only their own information" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit edit_user_path(@admin)

      expect(page).to have_content("Edit your profile, #{@admin.name}")
      expect(page).to_not have_content(@user.name)
    end

    it "user can edit only their own information" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit edit_user_path(@user)

      expect(page).to have_content("Edit your profile, #{@user.name}")
      expect(page).to_not have_content(@admin.name)
    end

    it "visitor cannot get to the edit user page" do
      visit edit_user_path(@user)

      expect(page).to have_content("The page you were looking for doesn't exist")
    end

    it "I cannot edit another users path" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit edit_user_path(@user)

      expect(page).to have_content("Edit your profile, #{@admin.name}")
    end
  end

  describe "when I visit the user dashboard" do
    it "admin can see a link to edit their profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(@admin))
      expect(page).to have_content("Edit your profile, #{@admin.name}")
    end

    it "user can see a link to edit their profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_path

      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(@user))
      expect(page).to have_content("Edit your profile, #{@user.name}")
    end
  end
end
