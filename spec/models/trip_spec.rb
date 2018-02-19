require 'rails_helper'

describe Trip, type: :model do
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:bike_id) }
  it { should validate_presence_of(:subscription_type) }
  it { should validate_presence_of(:zip_code) }

  describe "relationships" do
    it { is_expected.to belong_to(:start_station) }
    it { is_expected.to belong_to(:end_station) }
  end
end
