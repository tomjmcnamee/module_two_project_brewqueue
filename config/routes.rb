Rails.application.routes.draw do
  get 'user_brew_queues/index'
  get 'user_brew_queues/show'
  get 'user_brew_queues/edit'
  get 'user_brew_queues/new'
  resources :breweries 
  resources :users
  resources :user_brew_queues
  resources :comments 
  resources :visits
end
