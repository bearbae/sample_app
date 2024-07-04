Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :products
  get 'demo_partials/new'
  get 'demo_partials/edit'
  get 'static_pages/home'
  get 'static_pages/help'

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  resources :users, only: %i(new create show)
  root 'static_pages#home'
end
