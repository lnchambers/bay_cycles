class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :end_date, :bike_id, :subscription_type, :zip_code

  belongs_to :start_station, class_name: 'Station'
  belongs_to :end_station, class_name: 'Station'
end