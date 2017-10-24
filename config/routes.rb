Rails.application.routes.draw do

  get 'post/new'

  get 'post/index'

  get 'users/new'

  get 'users/create'

  root   'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :posts, :only => [:index, :new, :create]

end
