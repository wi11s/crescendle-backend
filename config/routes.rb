Rails.application.routes.draw do
  resources :plays, only: [:create]
  resources :guesses, only: [:create, :index]
  resources :songs
  resources :users, only: [:create]

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  get "/daily/:date", to: "songs#daily"
  get "/song_guesses/:user_id/:song_id", to: "guesses#song_guesses"
  get "/song_plays/:user_id/:song_id", to: "plays#song_plays"
  post "/song_plays/:user_id/:song_id", to: "plays#create"
  patch "/song_plays/:user_id/:song_id", to: "plays#update"
end
