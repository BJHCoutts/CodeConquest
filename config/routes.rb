Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#index', as: 'root'
<<<<<<< HEAD
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  #Drill Routes
=======
>>>>>>> 0458fe21a67f562030725249a21661d376246ada
  
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]
  resources :drill_groups
  resources :drills
  
end



