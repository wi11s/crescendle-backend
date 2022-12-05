Rails.application.routes.draw do
  resources :test_things
  resources :individual_stats, only: [:create]
  resources :guesses, only: [:create, :index]
  resources :songs
  resources :users, only: [:create, :update]

  get "/me", to: "users#me"
  post "/auth/login", to: "auth#login"
  get "/daily/:date", to: "songs#daily"
  get "/song_guesses/:user_id/:song_id", to: "guesses#song_guesses"
  get "/song_plays/:user_id/:song_id", to: "individual_stats#song_plays"
  post "/song_plays/:user_id/:song_id", to: "individual_stats#create"
  patch "/song_plays/:user_id/:song_id", to: "individual_stats#update"
  patch "/completed/:user_id/:song_id", to: "individual_stats#completed"
  get "/stats/:date", to: "individual_stats#stats"
  patch "/users/:id/:date", to: "users#update_streak"
  post "/users_with_data/:streak/:id", to: "users#create_with_data"
end
