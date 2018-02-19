Rails.application.routes.draw do

  resources :stations
  resources :conditions

  get "/stations-dashboard", :to => "stations_dashboard#index"

end
