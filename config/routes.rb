Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  root   'static_pages#home'

  get '/login', to: 'sessions#new'
  get '/login', to: 'sessions#create'

  resources :users
end
