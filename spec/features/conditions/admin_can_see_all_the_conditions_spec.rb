require 'rails_helper'

describe 'As an Admin' do
  before :each do
    @admin = create(:admin)
    @condition = create(:condition)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  describe 'when I visit the conditions index page' do
    it 'I can see everything a visitor can see' do
      visit conditions_path

      expect(page).to have_content("Date: #{@condition.date}")
      expect(page).to have_content("Max Temperature: #{@condition.max_temperature}")
      expect(page).to have_content("Mean Temperature: #{@condition.mean_temperature}")
      expect(page).to have_content("Min Temperature: #{@condition.min_temperature}")
      expect(page).to have_content("Humidity: #{@condition.mean_humidity}")
      expect(page).to have_content("Mean Visibility: #{@condition.mean_visibility} miles")
      expect(page).to have_content("Mean Wind Speed: #{@condition.mean_wind_speed}mph")
      expect(page).to have_content("Precipitation: #{@condition.precipitation} inches")
    end

    it "I can also see a delete button" do
      visit conditions_path

      expect(page).to have_content("Delete")
    end

      it "I can also see an edit button" do
      visit conditions_path

      expect(page).to have_content("Edit")
    end
  end
end