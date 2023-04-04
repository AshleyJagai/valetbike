Rails.application.routes.draw do
  resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'

  resources :users
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  get 'main/index'
  get 'main/tutorial'
  get 'main/help'
  root to: "main#index"
  #root to: "stations#index"
end