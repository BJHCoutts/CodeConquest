Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#index', as: 'root'
  get '/leaderboard' => 'users#leaderboard' #we might change this route later and add more features
  resources :users, only: [:new, :create, :edit, :update, :index] do 
    get :update_approved, on: :member
    resource :password, only: [:edit, :update]
  end
  resource :session, only: [:new, :destroy, :create]
  resources :drill_groups, shallow:true do
    resources :drills, only: [:new, :show, :create, :edit, :destroy] do
      resources :questions, only: [:new, :create, :edit, :update, :destroy] do
      end
      resources :transcripts, only: [:create, :show]
    end
  end
  namespace :admin do
        resources :dashboard, only: [:index]
  end
end