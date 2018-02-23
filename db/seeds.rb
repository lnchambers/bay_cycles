# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def zip_code_cleaner(zip)
  if zip
    zip.to_s[0, 5]
  else
    "00000"
  end
end

station_file = "db/fixture_data/station.csv"
twip_file = "db/fixture_data/trip.csv"
weather_file = "db/fixture_data/weather.csv"

start_time = Time.now
FastestCSV.open(station_file) do |csv|
  csv.shift
  while values = csv.shift
    Station.create!(
      id: values[0],
      name: values[1],
      dock_count: values[4],
      city: values[5],
      installation_date: Date.strptime(values[6], '%m/%d/%y')
      )
    puts "#{values[1]} created"
  end
end

FastestCSV.open(twip_file) do |csv|
  csv.shift
  while values = csv.shift
    twip = Trip.create!(
      duration: values[1],
      start_date: Date.strptime(values[2], '%m/%d/%y'),
      end_date: Date.strptime(values[5], '%m/%d/%y'),
      bike_id: values[8],
      subscription_type: values[9],
      zip_code: zip_code_cleaner(values[10]),
      start_station_id: values[4],
      end_station_id: values[7]
    )
    puts "Twip ##{twip.id} created"
  end
end

FastestCSV.open(weather_file) do |csv|
  csv.shift
  while values = csv.shift
    condition = Condition.create!(
      date: Date.strptime(values[0], '%m/%d/%y'),
      max_temperature: values[1] || 0,
      mean_temperature: values[2] || 0,
      min_temperature: values[3] || 0,
      mean_humidity: values[8] || 0,
      mean_visibility: values[14] || 0,
      mean_wind_speed: values[17] || 0,
      precipitation: values[19] || 0
    )
    puts "Condition ##{condition.id} created"
  end
end
end_time = Time.now
puts "#{end_time - start_time} seconds to import records. You do the math"

User.create!(name: "Luke", email: "Luke", password: "password", role: 1)
User.create!(name: "Ellen", email: "Ellen", password: "password", role: 1)
User.create!(name: "Luis", email: "Luis", password: "password", role: 1)
