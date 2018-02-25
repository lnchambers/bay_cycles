require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit the edit condition path' do
    it 'I see a form to update a condition' do
      @station = create(:station)
      @trip = create(:trip)
      @condition = create(:condition)
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit edit_admin_condition_path(@condition)

      fill_in "condition[mean_temperature]", with: 2
      fill_in "condition[mean_humidity]",    with: 2
      click_on "Update"

      expect(current_path).to eq(condition_path(@condition))
      expect(page).to have_content(2)
      expect(page).to have_content("Condition updated")
    end
  end
end