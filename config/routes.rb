Rails.application.routes.draw do

  root "welcome#index"

  resources :stations, except: [:new, :edit]

  resources :trips, except: [:new, :edit]

  resources :conditions, except: [:new, :edit]

  resources :users, except: [:index, :destroy, :show]

  get "/stations-dashboard", :to => "stations_dashboard#index"

  get "/trips-dashboard", :to => "trips_dashboard#index"

  get "/dashboard", :to => "users#show"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", :to => "dashboard#show"
    resources :trips, only: [:new, :edit]
    resources :stations, only: [:new, :edit]
    resources :conditions, only: [:new, :edit]
  end

  get "/bike-shop", :to => "bike_shop/accessories#index"

  namespace :bike_shop do
    resources :accessories, except: [:index]
  end

  resources :carts, only: [:create, :index]
end
