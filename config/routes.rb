Rails.application.routes.draw do
  root "leaderboard#index"

  resources :players, only: [ :index, :new, :create, :destroy ]
  resources :matches, only: [ :index, :new, :create ]

  get "up" => "rails/health#show", as: :rails_health_check
end
