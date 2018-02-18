class Station < ApplicationRecord
  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.average_bike_count
    average(:dock_count)
  end
end
