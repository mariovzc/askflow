Rails.application.routes.draw do

  get '/sign_up', to: 'users#new', as: :sign_up

  resources :users, only: [:new, :create]  
end
