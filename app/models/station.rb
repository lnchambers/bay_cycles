class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date

  has_many :start_trips, class_name: "Trip", foreign_key: "start_station_id"
  has_many :end_trips, class_name: "Trip", foreign_key: "end_station_id"

  def self.average_bike_count
    average(:dock_count)
  end

  def self.highest_bike_count
    maximum(:dock_count)
  end

  def self.station_with_highest_bike_count
    where("dock_count >= ?", maximum(:dock_count))
  end

  def self.fewest_bike_count
    minimum(:dock_count)
  end

  def self.station_with_lowest_bike_count
    where("dock_count <= ?", minimum(:dock_count))
  end

  def self.newest_station
    where("installation_date >= ?", maximum(:installation_date))
  end

  def self.oldest_station
    where("installation_date <= ?", minimum(:installation_date))
  end

  def total_rides_started
    start_trips.count
  end

  def total_rides_ended
    end_trips.count
  end

  def most_frequent_end_station
    start_trips.select("trips.*, count(trips.id) AS trip_count")
    .group(:start_station_id, :id)
    .order('trip_count DESC')
    .first
    .end_station
  end

  def most_frequent_start_station
    end_trips.select("trips.*, count(trips.id) AS trip_count")
    .group(:end_station_id, :id)
    .order("trip_count DESC")
    .first
    .start_station
  end

  def highest_originations_by_date
    start_trips.group(:start_date)
    .order("count(*) DESC")
    .count
    .first
  end

  def most_common_zip
    start_trips.group(:zip_code)
    .order('count(*) DESC')
    .count
    .first
  end
end
