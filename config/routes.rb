Rails.application.routes.draw do
  root "main#index"


  get 'index', to: "main#index"
  #get 'tutorial', to: "main#tutorial"
  #get 'help', to: "main/help"


  resources :users, only: [:new, :create, :edit, :update] 
  resources :rentals
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # delete 'logout' to: 'sessions#delete'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  get 'stations/map'
  get 'stations/index'
  get 'stations/return'
  get 'users/update', to: 'users#update'
  #get 'stations/:identifier', to 'stations#location'

  #resources :users, except: [:show]
  resources :stations, param: :identifier 

  resources :sessions, except: [:show]
  resources :main, except: [:show]
  # get 'main/menu'
  get 'main/help'
  get 'main/tutorial'
  get 'main/thankyou'
  get 'sessions/destroy'
  get 'users/profile' 
  get 'sessions/new'
  get 'users/new'

  # get 'main/rent'
  # get 'main/return'
  # get 'main/return'
end