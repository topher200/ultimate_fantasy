Fantasy::Application.routes.draw do
  resources :stats, :games, :fantasy_players, :owners, :players, :ultimate_teams

  get "home/index"
  match 'draft/index'
  post 'draft/draft'
  
  root :to => 'home#index'
end
