Rails.application.routes.draw do
  get 'followings/create'

  get 'followings/destroy'

  resources :users, only: [:new, :create, :show] do
    member do
      get :following, :followers
    end
  end

  resources :followings, only: [:create, :destroy]

  root to: 'posts#index'

  #sessions
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#delete"

  #posts
  resources :posts, only: [:new, :create, :index, :show]
  
end
