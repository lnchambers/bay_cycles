FactoryBot.define do

  factory :trip do
    start_date "2018-02-19 12:27:55"
    end_date "2018-02-19 12:27:55"
    bike_id 1
    subscription_type "Subscriber"
    zip_code 1
    start_station_id 1
    end_station_id 1

    sequence(:duration) {|n| n }
  end
end
