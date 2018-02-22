require 'rails_helper'

describe 'As an admin' do
  describe 'when I visit conditions index' do
    scenario 'I can delete a condition' do
      @station = create(:station)
      @trip = create(:trip)
      @condition = create(:condition)
      @admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit conditions_path

      click_on "Delete"

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content("Condition deleted")
      expect(page).to_not have_content("2018-02-19 15:47:07")
    end
  end
end