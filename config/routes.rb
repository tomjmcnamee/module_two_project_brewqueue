Rails.application.routes.draw do
  resources :breweries 
  resources :users
  resources :user_brew_queues
  resources :comments 
  resources :visits
end

