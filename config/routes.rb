Rails.application.routes.draw do

  root 'pages#home'

  resources :sessions, only: [:new, :create, :destroy]

  resources :games do    
    resources :guides
    resources :resources
  end

  resources :votes

  resources :requests
  #resources :votes


  resources :users do     
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

  get '/votes/new', to: 'votes#new'
  get '/games/:id/requests', to: 'games#requests', as: 'game_requests'

end
