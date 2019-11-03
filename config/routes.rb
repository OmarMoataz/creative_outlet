# frozen_string_literal: true

Rails.application.routes.draw do
  get 'followings/create'

  get 'followings/destroy'

  resources :users, only: %i[new create show index] do
    member do
      get :following, :followers
    end
  end

  post '/auth/login', to: 'authentication#login'

  resources :followings, only: %i[create destroy]

  root to: 'posts#index'

  # posts
  resources :posts, only: %i[new create index show]
end
