Rails.application.routes.draw do

  root "welcome#index"

  resources :stations, only: [:index, :show]

  resources :trips, only: [:index, :show]

  resources :conditions, only: [:index, :show]

  resources :users, except: [:index, :destroy, :show]

  get "/stations-dashboard", :to => "stations_dashboard#index"

  get "/trips-dashboard", :to => "trips_dashboard#index"

  get "/dashboard", :to => "users#show"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", :to => "dashboard#show"
    resources :trips, except: [:index, :show]
    resources :stations, except: [:index, :show]
    resources :conditions, except: [:index, :show]
    get "bike-shop", :to => "bike_shop#index"
    get "bike-shop/new", :to => "accessories#new"
    resources :accessories, only: [:edit, :update, :create, :show]
  end

  get "/bike-shop", :to => "bike_shop/accessories#index"

  namespace :bike_shop do
    resources :accessories, except: [:index]
  end

  resources :carts, only: [:create, :index, :destroy]
end
