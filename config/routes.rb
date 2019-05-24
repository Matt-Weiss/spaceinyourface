Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :search, only: [:new, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/o/oauth2/auth', to: 'sessions#create'
  get 'auth/google_oauth2/callback', to: 'sessions#create'

end
