Rails.application.routes.draw do
<<<<<<< HEAD
  get 'user_brew_queues/index'
  get 'user_brew_queues/show'
  get 'user_brew_queues/edit'
  get 'user_brew_queues/new'
=======

>>>>>>> c6f5125efb7177412bee4b7c9e6fe4cb6d85fa6c
  resources :breweries 
  resources :users
  resources :user_brew_queues
  resources :comments 
  resources :visits
end

