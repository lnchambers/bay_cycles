class Condition < ApplicationRecord
  has_many :trips
  validates_presence_of :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation

  def self.temp_ranges(range)
    joins(:trips)
    .where("max_temperature >= #{range[0]} AND max_temperature <= #{range[1]}")
    .group(:condition_id)
    .count(:condition_id)
    .values
  end

  def self.average_rides_for_temps(range)
    breakdown_rides = temp_ranges(range)
    breakdown_rides.sum / breakdown_rides.size.to_f
  end

  def self.most_rides_for_temps(range)
    temp_ranges(range).max
  end

  def self.lowest_rides_for_temps(range)
    temp_ranges(range).min
  end

  def self.precipitation_ranges(range)
    joins(:trips)
    .where("precipitation >= #{range[0]} AND precipitation <= #{range[1]}")
    .group(:condition_id)
    .count(:condition_id)
    .values
  end

  def self.average_rides_for_precipitation(range)
    breakdown_rides = precipitation_ranges(range)
    (breakdown_rides.sum / breakdown_rides.size.to_f).round(1)
  end

  def self.most_rides_for_precipitation(range)
    precipitation_ranges(range).max
  end

  def self.lowest_rides_for_precipitation(range)
    precipitation_ranges(range).min
  end

  def self.wind_speed_ranges(range)
    joins(:trips)
    .where("mean_wind_speed >= #{range[0]} AND mean_wind_speed <= #{range[1]}")
    .group(:condition_id)
    .count(:condition_id)
    .values
  end

  def self.average_rides_for_wind(range)
    breakdown_rides = wind_speed_ranges(range)
    (breakdown_rides.sum / breakdown_rides.size.to_f).round(1)
  end

  def self.most_rides_for_wind(range)
    wind_speed_ranges(range).max
  end

  def self.lowest_rides_for_wind(range)
    wind_speed_ranges(range).min
  end

  def self.visibility_ranges(range)
    joins(:trips)
    .where("mean_visibility >= #{range[0]} AND mean_visibility <= #{range[1]}")
    .group(:condition_id)
    .count(:condition_id)
    .values
  end

  def self.average_rides_for_visibility(range)
    breakdown_rides = visibility_ranges(range)
    (breakdown_rides.sum / breakdown_rides.size.to_f).round(1)
  end

  def self.most_rides_for_visibility(range)
    visibility_ranges(range).max
  end

  def self.lowest_rides_for_visibility(range)
    visibility_ranges(range).min
  end
end
