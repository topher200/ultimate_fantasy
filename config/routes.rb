Fantasy::Application.routes.draw do
  resources :stats

  resources :games

  resources :fantasy_players

  resources :owners

  resources :players

  resources :ultimate_teams

  get "home/index"

  match 'draft/index'
  post 'draft/draft'
  
  root :to => 'home#index'
end
