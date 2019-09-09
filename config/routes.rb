Rails.application.routes.draw do
  resources :breweries 
  resources :user_brew_queues
  resources :comments 
  resources :visits

  # User Routes
  
  get "/users/", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "signup"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  post "/users", to: "users#create"

  patch "/users/:id", to: "users#update"

  delete "/users/:id/delete", to: "users#destroy"

  # Session Routes 
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

end

