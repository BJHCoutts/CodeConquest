Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#index', as: 'root'
  get '/leaderboard' => 'users#leaderboard'
  resources :users, only: [:new, :create] 
  resource :session, only: [:new, :destroy, :create]
  resources :drill_groups
  resources :drills
  
end



