Rails.application.routes.draw do

  root 'questions#index'

  get '/sign_up', to: 'users#new', as: :sign_up
  get '/log_in', to: 'sessions#new', as: :log_in
  get '/sessions', to: 'sessions#new'
  delete '/log_out', to: 'sessions#destroy', as: :log_out

  resources :users, only: [:new, :create]  
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions do 
    put "like", to: "questions#upvote"
    put "dislike", to: "questions#downvote"
    put "unvote", to: "questions#unvote"
    post "create_question_comment", to: "comments#question_comments"
    resources :comments, module: :questions
  end
  resources :comments do 
    put "like", to: "comments#upvote"
    put "dislike", to: "comments#downvote"
    put "unvote", to: "comments#unvote"
  end
  post 'comments/:id/reply', to: 'comments#reply', as: :reply

end
