Rails.application.routes.draw do
  root to: 'jobs#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :jobs, except: [:destroy] do
    member do
      post 'punch_in', to: 'punches#punch_in'
      post 'punch_out', to: 'punches#punch_out'
    end
  end

  resources :users, except: [:destroy]

end
