Rails.application.routes.draw do
  root to: 'jobs#index'

  resources :jobs, except: [:destroy] do
    resources :punches, only: [:create]
  end
end
