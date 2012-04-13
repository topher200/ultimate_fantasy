Fantasy::Application.routes.draw do
  get "roster/index"

  devise_for :users

  resources :stats, :games, :fantasy_players, :owners, :players, :ultimate_teams

  get "home/index"
  match 'draft/index'
  post 'draft/draft'
  post 'fantasy_players/change_status'
  
  root :to => 'home#index'
end
