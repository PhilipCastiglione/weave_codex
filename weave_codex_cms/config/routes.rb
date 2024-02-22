# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :publishing, only: [:index] do
      collection do
        post :publish
      end
    end

    resources :biomes
    resources :characters
    resources :cities
    resources :domains
    resources :fauna
    resources :flora
    resources :organizations
    resources :species

    root to: 'publishing#index'
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'admin/publishing#index'
end
