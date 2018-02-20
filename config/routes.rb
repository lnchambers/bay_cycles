Rails.application.routes.draw do

  root "welcome#index"

  resources :stations

  resources :trips

  resources :conditions

  resources :users, except: [:index, :destroy, :show]

  get "/stations-dashboard", :to => "stations_dashboard#index"

  get "/dashboard", :to => "users#show"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", :to => "dashboard#show"
  end

end
