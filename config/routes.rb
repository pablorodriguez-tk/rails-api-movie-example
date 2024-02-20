Rails.application.routes.draw do
  resources :users
  resources :sources
  get 'movies/action', to: 'movies#action_movies'
  resources :movies
end
