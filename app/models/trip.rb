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

<<<<<<< HEAD
  def self.start_station_most_rides
    select("start_station_id, count(start_station_id)")
    .group("start_station_id")
    .order("count(start_station_id) desc")
    .first
  end

  def self.end_station_most_rides
    select("end_station_id, count(end_station_id)")
    .group("end_station_id")
    .order("count(end_station_id) desc")
    .first
  end

  def self.monthly_breakdown_of_rides
    select("extract(month from start_date) as month, count(start_date)")
    .group("start_date")
    .order("count(start_date) desc")
  end

  def self.most_ridden_bike
    select("bike_id, count(bike_id)")
    .group("bike_id")
    .order("count(bike_id) desc")
    .first
  end

  def self.least_ridden_bike
    select("bike_id, count(bike_id)")
    .group("bike_id")
    .order("count(bike_id) desc")
    .last
  end

  def self.subscription_type_breakout
    select("subscription_type, count(subscription_type)")
    .group("subscription_type")
    .order("count(subscription_type) desc")
  end

  def self.subscription_type_percentage_first
    (subscription_type_breakout.first.count / all.count.to_f * 100).round(1)
  end

  def self.subscription_type_percentage_last
    (subscription_type_breakout.last.count / all.count.to_f * 100).round(1)
  end

  def self.most_popular_ride_date
    select("start_date, count(start_date)")
    .group("start_date")
    .order("count(start_date) desc")
    .first
  end

  def self.least_popular_ride_date
    select("start_date, count(start_date)")
    .group("start_date")
    .order("count(start_date) desc")
    .last
=======
  def self.start_station_ordered_by_rides
    select("start_station_id, count(start_station_id)")
    .group("start_station_id")
    .order("count(start_station_id) desc")
  end

  def self.end_station_ordered_by_rides
    select("end_station_id, count(end_station_id)")
    .group("end_station_id")
    .order("count(end_station_id) desc")
>>>>>>> Continue working on ActiveRecord methods for trips.
  end

  def self.monthly_breakdown_of_rides
    select("extract(month from start_date) as month, count(start_date)")
    .group("start_date")
    .order("count(start_date) desc")
  end

  def self.ordered_by_used_bike
    select("bike_id, count(bike_id)")
    .group("bike_id")
    .order("count(bike_id) desc")
  end
end
