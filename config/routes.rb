Rails.application.routes.draw do

  get 'sessions/new'
  root 'pages#index'
  get 'players/show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pages
  resources :teams
  resources :games
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
