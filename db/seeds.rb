# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
station_file = "db/development_data/station.csv"
twip_file = "db/development_data/trip.csv"
weather_file = "db/development_data/weather.csv"

start_time = Time.now
puts "Parsing Stations"
stations = SmarterCSV.process(station_file)
puts "Stations processed"

puts "Parsing Twips"
twips = SmarterCSV.process(twip_file)
puts "Twips processed"

puts "Parsing Conditions"
conditions = SmarterCSV.process(weather_file)
puts "Conditions processed"

puts "Cleaning Data..."

puts "Cleaning Stations"
stations.each do |station|
  station[:installation_date] = Date.strptime(station[:installation_date], '%m/%d/%y')
end
puts "Stations clean"

puts "Cleaning Conditions"
conditions.each do |condition|
  condition[:date] = Date.strptime(condition[:date], '%m/%d/%y')
  condition[:max_temperature_f] = condition[:max_temperature_f] || "0"
  condition[:min_temperature_f] = condition[:min_temperature_f] || "0"
  condition[:mean_temperature_f] = condition[:mean_temperature_f] || "0"
  condition[:mean_humidity] = condition[:mean_humidity] || "0"
  condition[:mean_visibility_miles] = condition[:mean_visibility_miles] || "0"
  condition[:mean_wind_speed_mph] = condition[:mean_wind_speed_mph] || "0"
  condition[:precipitation_inches] = condition[:precipitation_inches] || "0"
end
puts "Conditions clean"

puts "Cleaning Twips"
twips.each do |twip|
  twip[:start_date] = Date.strptime(twip[:start_date], '%m/%d/%y')
  twip[:end_date] = Date.strptime(twip[:end_date], '%m/%d/%y')
  twip[:zip_code] = twip[:zip_code] || "00000"
  twip[:zip_code] = twip[:zip_code].to_s[0, 5].to_i
end
puts "Twips clean"

stations.each do |station|
  Station.create!(
                  id: station[:id],
                  name: station[:name],
                  dock_count: station[:dock_count],
                  city: station[:city],
                  installation_date: station[:installation_date]
                 )
  # puts "Created #{station[:name]}!"
end

conditions.each do |condition|
  condition = Condition.create!(
                  date: condition[:date],
                  max_temperature: condition[:max_temperature_f],
                  mean_temperature: condition[:mean_temperature_f],
                  min_temperature: condition[:min_temperature_f],
                  mean_humidity: condition[:mean_humidity],
                  mean_visibility: condition[:mean_visibility_miles],
                  mean_wind_speed: condition[:mean_wind_speed_mph],
                  precipitation: condition[:precipitation_inches]
                )
  # puts "Condition #{condition[:id]} created!"
end

twips.each do |twip|
  twip = Trip.create!(
                  duration: twip[:duration],
                  start_date: twip[:start_date],
                  end_date: twip[:end_date],
                  bike_id: twip[:bike_id],
                  subscription_type: twip[:subscription_type],
                  zip_code: twip[:zip_code],
                  start_station_id: twip[:start_station_id],
                  end_station_id: twip[:end_station_id]
                )
  # puts "Twip #{twip[:id]} created!"
end
end_time = Time.now
puts "#{end_time - start_time} seconds to import records. You do the math"

# start_time = Time.now
# FastestCSV.open(station_file) do |csv|
#   csv.shift
#   while values = csv.shift
#     Station.create!(
#       id: values[0],
#       name: values[1],
#       dock_count: values[4],
#       city: values[5],
#       installation_date: Date.strptime(values[6], '%m/%d/%y')
#       )
#   end
# end
#
# FastestCSV.open(twip_file) do |csv|
#   csv.shift
#   while values = csv.shift
#     Trip.create(
#       duration: values[2],
#       start_date: Date.strptime(values[2], '%m/%d/%y'),
#       end_date: Date.strptime(values[5], '%m/%d/%y'),
#       bike_id: values[8],
#       subscription_type: values[9],
#       zip_code: values[10].to_s[0, 5] || "00000",
#       start_station_id: values[4],
#       end_station_id: values[7]
#     )
#   end
# end
#
# FastestCSV.open(weather_file) do |csv|
#   csv.shift
#   while values = csv.shift
#     Condition.create!(
#       date: Date.strptime(values[0], '%m/%d/%y'),
#       max_temperature: values[1] || 0,
#       mean_temperature: values[2] || 0,
#       min_temperature: values[3] || 0,
#       mean_humidity: values[8] || 0,
#       mean_visibility: values[14] || 0,
#       mean_wind_speed: values[17] || 0,
#       precipitation: values[19] || 0
#     )
#   end
# end
# end_time = Time.now
# puts "#{end_time - start_time} seconds to import records. You do the math"
