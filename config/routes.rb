Rails.application.routes.draw do

  resources :stations
  resources :trips  

  get "/stations-dashboard", :to => "stations_dashboard#index"

end
