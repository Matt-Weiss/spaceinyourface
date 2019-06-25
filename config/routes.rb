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

  get 'auth/google_oauth2/callback', to: 'sessions#create'

  resources :iss_search, only: [:index, :new]
  get '/iss_alerts', to: 'iss_alerts#create'

  get '/geocode', to: 'geocode#show'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
