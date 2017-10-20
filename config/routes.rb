Rails.application.routes.draw do

  get 'users/new'

  get 'users/create'

  root   'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
end
