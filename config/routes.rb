# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/google_oauth2/callback', to: 'sessions#google_oauth2_callback'
  delete '/auth/google_oauth2', to: 'sessions#destroy'

  resources :pages, only: [] do
    collection do
      get 'home'
      get 'mail'
    end
  end

  resources :problem, only: [:show]

  namespace :filter do
    resources :questions, only: [:index]
  end

  namespace :current_user do
    resources :answers, only: %i[index create]
  end
end
