Rails.application.routes.draw do
  resources :practices
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
  patch "/streak/:id/:date", to: "users#update_streak"
  patch "/high_score/:id", to: "users#update_interval_high_score"
  post "/users_with_data/:streak/:id", to: "users#create_with_data"
  get "/user_stats/:user_id", to: "individual_stats#user_stats"
  get "/user_guess_stats/:user_id", to: "guesses#user_guess_stats"
  get "/goals/:user_id", to: "goals#index"
  post "/goals/:user_id", to: "goals#create"
  patch "/goals/:id/:user_id", to: "goals#update"
end
