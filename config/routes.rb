Rails.application.routes.draw do
  root 'leagues#index'

  get 'leagues/index'
  get 'sessions/logout'
  get 'sessions/login'

  resources :games
  post "games/new" => "games#create"

  resources :teams
  resources :users
   post "users/:id/edit" => "user#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :confirmations
  post "confirmations/new" => "confirmations#create"

  resources :team1confirmations
  post "team1confirmations/new" => "team1confirmations#create"

  resources :team2confirmations
  post "team2confirmations/new" => "team2confirmations#create"

end
