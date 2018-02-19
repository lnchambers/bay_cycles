Rails.application.routes.draw do

  resources :stations

  get "/stations-dashboard", :to => "stations_dashboard#index"

end
