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
      end_station_id: values[7],
      condition: Condition.first
    )
    puts "Twip ##{twip.id} created"
  end
end

end_time = Time.now
puts "#{end_time - start_time} seconds to import records. You do the math"

User.create!(name: "Luke", email: "Luke", password: "password", role: 1)
User.create!(name: "Ellen", email: "Ellen", password: "password", role: 1)
User.create!(name: "Luis", email: "Luis", password: "password", role: 1)

Accessory.create!(name: "Blamfs", description: "In addition to their treasure reaction with chumbles, they also hold the secret of life.", price: 800)
Accessory.create!(name: "Chumbles", description: "Worthless items that are only good for helping blamfs. Buy if you want to.", price: 1600)
Accessory.create!(name: "Schlem", description: "If you have to read this, you can't afford this.", price: 1200)
Accessory.create!(name: "Szechuan Sauce", description: "Spread this over your chain to attain enlightenment.", price: 20000)
Accessory.create!(name: "Plumbus", description: "A household device that needs no introduction!", price: 3200)
Accessory.create!(name: "Fleeb", description: "A tool used for making Plumbus'.", price: 6400)
Accessory.create!(name: "Fleeb Juice", description: "Secretions from a Fleeb! Rare and exotic mostly maybe!", price: 9999)
Accessory.create!(name: "Schleem", description: "Used for smoothing dinglebops. Use a bunch.", price: 3699)
Accessory.create!(name: "Dinglebop", description: "To attain maximum plumbus, push a dinglebop through a grumbo.", price: 3899)
Accessory.create!(name: "Grumbo", description: "An additive used for attaining maximum plumbus. Must use with dinglebop.", price: 30299)
Accessory.create!(name: "Schlami", description: "A beautiful invention for the verification of plumbus quality.", price: 7599)
Accessory.create!(name: "Hizzards", description: "WARNING: Have a nasty habit of getting in the way.", price: 8799)
