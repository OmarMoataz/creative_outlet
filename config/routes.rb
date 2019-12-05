# frozen_string_literal: true

Rails.application.routes.draw do
  post '/login', to: 'authentication#login'

  # users
  resources :users, only: %i[new create show index] do
    member do
      post :toggle_follow
    end
  end

  # posts
  resources :posts, only: %i[new create index show]
end
