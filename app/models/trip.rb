class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :end_date, :bike_id, :subscription_type, :zip_code
end
