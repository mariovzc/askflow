Rails.application.routes.draw do

  root 'questions#index'

  get '/sign_up', to: 'users#new', as: :sign_up
  get '/log_in', to: 'sessions#new', as: :log_in
  get '/sessions', to: 'sessions#new'
  delete '/log_out', to: 'sessions#destroy', as: :log_out

  resources :users, only: [:new, :create]  
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions do 
    resources :comments, module: :questions    
  end
end
