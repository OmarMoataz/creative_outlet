Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'posts#index'

  #sessions
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#delete"

  #posts
  resources :posts, only: [:new, :create, :index, :show]
  
end
