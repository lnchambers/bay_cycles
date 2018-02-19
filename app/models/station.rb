class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates_presence_of :name, :dock_count, :city, :installation_date

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
end
