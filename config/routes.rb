Rails.application.routes.draw do
  root to: 'jobs#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :jobs, except: [:destroy] do
    resources :punches, only: [:create]
  end

  resources :users, except: [:destroy]

end
