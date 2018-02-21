# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
station_file = "db/development_data/station.csv"
trip_file = "db/development_data/trip.csv"
weather_file = "db/development_data/weather.csv"

station_file_options = {header_transformations: [ key_mapping: {name: :name, dock_count: :dock_count, city: :city, installation_date: :installation_date} ] }

puts "Processing..."

stations = SmarterCSV.process( station_file, station_file_options )
# trips = SmarterCSV.process( trip_file )
# conditions = SmarterCSV.process( weather_file )

puts "Cleaning Data..."

binding.pry

stations.each do |station|
  binding.pry
  Station.create!(id: station[:id], name: station[:name], dock_count: station[:dock_count], city: station[:city], installation_date: station[:installation_date])
  puts "Created #{station[:name]}"
end
