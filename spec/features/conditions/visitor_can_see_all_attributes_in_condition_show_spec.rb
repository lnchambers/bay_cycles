require "rails_helper"

describe "As a visitor" do
  before :each do
    @condition = create(:condition)
  end
  describe "when I visit the conditions index page" do
    it "I see the conditions date" do
      visit conditions_path

      expect(page).to have_content("Date: #{@condition.date}")
    end

    it "I see the conditions max temperature" do
      visit conditions_path

      expect(page).to have_content("Max Temperature: #{@condition.max_temperature}")
    end

    it "I see the conditions mean temperature" do
      visit conditions_path

      expect(page).to have_content("Mean Temperature: #{@condition.mean_temperature}")
    end

    it "I see the conditions min temperature" do
      visit conditions_path

      expect(page).to have_content("Min Temperature: #{@condition.min_temperature}")
    end

    it "I see the conditions mean humidity" do
      visit conditions_path

      expect(page).to have_content("Humidity: #{@condition.mean_humidity}")
    end

    it "I see the conditions mean visibility in miles" do
      visit conditions_path

      expect(page).to have_content("Mean Visibility: #{@condition.mean_visibility} miles")
    end

    it "I see the conditions mean wind speed (mph)" do
      visit conditions_path

      expect(page).to have_content("Mean Wind Speed: #{@condition.mean_wind_speed}mph")
    end

    # it "I see the conditions precipitation (inches)" do
    #   visit conditions_path

    #   expect(page).to have_content("Precipitation: #{@condition.precipitation} inches")
    # end
  end
end