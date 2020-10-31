# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  resources :pages, only: [] do
    collection do
      get 'home'
      get 'mail'
    end
  end
end
