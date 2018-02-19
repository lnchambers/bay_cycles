FactoryBot.define do
  factory :trip do
    duration 1
    start_date "2018-02-19 12:27:55"
    end_date "2018-02-19 12:27:55"
    bike_id 1
    subscription_type "MyString"
    zip_code 1
    start_station_id station
    end_station_id station, name: "Station 2"
  end
end
