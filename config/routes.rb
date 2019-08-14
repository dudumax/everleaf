Rails.application.routes.draw do
  
  root to: "tasks#index"
  root to: "users#index"
  
  resources :users
  resources :tasks
end
