Rails.application.routes.draw do

  root 'pages#home'

  resources :sessions, only: [:new, :create, :destroy]

  resources :games do
    resources :requests
    resources :guides
    resources :resources
  end

  resources :users do
    resources :requests
    resources :guides
    resources :comments
    resources :posts    
  end

  resources :guides do
    resources :comments
  end

  resources :posts do
    resources :comments
  end

  resources :resources do
    resources :comments
  end

  



  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


end
