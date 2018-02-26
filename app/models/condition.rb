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
end
