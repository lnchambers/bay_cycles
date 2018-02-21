class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code

  belongs_to :start_station, class_name: 'Station'
  belongs_to :end_station, class_name: 'Station'

  def self.average_duration
    average(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.start_station_ordered_by_rides
    select("start_station_id, count(start_station_id)")
    .group("start_station_id")
    .order("count(start_station_id) desc")
  end

  def self.end_station_ordered_by_rides
    select("end_station_id, count(end_station_id)")
    .group("end_station_id")
    .order("count(end_station_id) desc")
  end
end
