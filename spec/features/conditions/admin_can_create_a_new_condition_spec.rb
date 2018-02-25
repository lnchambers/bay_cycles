require 'rails_helper'

describe 'As an Admin' do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  describe 'when I visit new conditions path' do
    it 'I can create a new condition' do
      visit new_admin_condition_path

      fill_in "condition[date]",	           with:  "2018-02-19 15:47:07"
      fill_in "condition[max_temperature]",	 with:  1
      fill_in "condition[mean_temperature]", with:  1
      fill_in "condition[min_temperature]",	 with:  1
      fill_in "condition[mean_humidity]",	   with:  1
      fill_in "condition[mean_visibility]",	 with:  1
      fill_in "condition[mean_wind_speed]",	 with:  1
      fill_in "condition[precipitation]",	   with:  1
    end

    it "I can see a flash message for success" do
      visit new_admin_condition_path

      fill_in "condition[date]",             with: "2018-02-19 15:47:07"
      fill_in "condition[max_temperature]",  with: 1
      fill_in "condition[mean_temperature]", with: 1
      fill_in "condition[min_temperature]",  with: 1
      fill_in "condition[mean_humidity]",    with: 1
      fill_in "condition[mean_visibility]",  with: 1
      fill_in "condition[mean_wind_speed]",  with: 1
      fill_in "condition[precipitation]",    with: 1
      click_on "Create Condition"

      expect(page).to have_content("Condition created")
    end

    it "I can see a flash message for failure" do
      visit new_admin_condition_path

      fill_in "condition[max_temperature]",  with: 1
      fill_in "condition[mean_temperature]", with: 1
      fill_in "condition[min_temperature]",  with: 1
      fill_in "condition[mean_humidity]",    with: 1
      fill_in "condition[mean_visibility]",  with: 1
      fill_in "condition[mean_wind_speed]",  with: 1
      fill_in "condition[precipitation]",    with: 1
      click_on "Create Condition"

      expect(page).to have_content("Condition not created. Try again.")
    end
  end
end