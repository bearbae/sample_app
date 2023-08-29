Rails.application.routes.draw do

  get "password_resets/new"
  get "password_resets/edit"
  get "password_resets/create"
  get "password_resets/update"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :products
  get "demo_partials/new"
  get "demo_partials/edit"
  root "static_pages#home"
  get "static_pages/home"
  get "static_pages/help"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create show edit update index destroy)
  resources :account_activations, only: %i(edit)
  resources :password_resets, only: %i(new create edit update)
end
