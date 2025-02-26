Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show]
  resources :deals
  resources :contacts
  resources :companies

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  
  get "/me", to: "users#show"
  delete "logout", to: "sessions#destroy"

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }
end
