Rails.application.routes.draw do
  
  get 'sessions/new'
  root to: "tasks#index"
 resources :sessions, only: [:new, :create, :destroy]
  
  resources :users
  
 
  resources :tasks
end
