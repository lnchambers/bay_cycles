Rails.application.routes.draw do

  resources :stations

  get "/stations-dashboard", :to => "station_dashboard#index"

end
