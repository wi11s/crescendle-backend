Rails.application.routes.draw do
  resources :guesses, only: [:create, :index]
  resources :songs
  resources :users, only: [:create]

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  get "/daily/:date", to: "songs#daily"
end
