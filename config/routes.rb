Rails.application.routes.draw do

  root "welcome#index"

  resources :stations

  resources :users, only: [:new]

  get "/stations-dashboard", :to => "stations_dashboard#index"

  get "/dashboard", :to => "users#show"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

end
