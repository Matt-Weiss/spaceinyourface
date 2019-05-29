Rails.application.routes.draw do

  root 'welcome#index'
  get '/about', to: 'about#index', as: :about

  resources :users, only: [:new, :create]
  resources :search, only: [:index, :new]
  resources :celestial_bodies, only: [:show] do
    resources :telescope, only: [:create]
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/o/oauth2/auth', to: 'sessions#create'
  get 'auth/google_oauth2/callback', to: 'sessions#create'

  resources :iss_search, only: [:index, :new]
  
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
