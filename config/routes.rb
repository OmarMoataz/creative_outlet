Rails.application.routes.draw do
  get 'users/create'

  get 'users/new'

  root to: 'posts#index'

  #sessions
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#delete"

  #posts
  resources :posts, only: [:new, :create, :index, :show]
  
end
