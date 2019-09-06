Rails.application.routes.draw do
  get 'breweries/new'
  get 'breweries/index'
  get 'breweries/show'
  get 'breweries/update'
  get 'breweries/edit'
  get 'breweries/destroy'
  get 'breweries/create'
  resources :breweries
  resources :users
  resources :user_brew_queues
  resources :comments
  resources :visits
 end