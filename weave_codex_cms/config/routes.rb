Rails.application.routes.draw do
  namespace :admin do
    resources :stats, only: [:index]
    resources :faunas
    resources :floras
    resources :species

    root to: "stats#index"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # static publish route
  post "/static/publish", to: "static#publish"

  # Defines the root path route ("/")
  root "static#index"
end
