Rails.application.routes.draw do

  root "welcome#index"

  resources :stations
<<<<<<< HEAD
  resources :trips  
=======
  resources :conditions

  resources :users, except: [:index, :destroy, :show]
>>>>>>> 849ce12bcb4af09d30f59e8e6e2359ca7021c67b

  get "/stations-dashboard", :to => "stations_dashboard#index"

  get "/dashboard", :to => "users#show"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", :to => "dashboard#show"
  end

end
