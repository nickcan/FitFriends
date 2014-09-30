Rails.application.routes.draw do
  post '/send_challenge' => 'challenges#send_challenge'
  get '/challenges/search/:keyword', to: 'challenges#search'
  get '/challenges/recent', to: 'challenges#recent'
  get '/challenges/trending', to: 'challenges#trending'
  get '/users/unfollow/:followee_id', to: 'users#unfollow'
  get '/users/follow/:followee_id', to: 'users#follow'

  root 'home#index'

  get 'challenges/search/:keyword', to: 'challenges#search'
  get 'challenges/recent', to: 'challenges#recent'
  get 'challenges/trending', to: 'challenges#trending'
  get '/users/search/:keyword', to: 'users#search'
  get '/users/show_follow', to: 'users#show_follow'



  get '/trends' => "tags#trends", as: :trends
  resources :challenges
  get '/users/current' => "users#current", as: :current
  get '/users/single_user/:id' => "users#single_user", as: :single_user

  get "/home" => "home#index", as: :home
  get "/log_in" => "sessions#new"
  post "/log_in" => "sessions#create"
  get "/log_out" => "sessions#destroy", as: :log_out
  get '/profile' => "static#index", as: :profile
  get "/tabs" => "home#tabs"
  post "/accept_challenge" => "challenges#accept_challenge", as: :accept_challenge

  get '/map' => "home#map"

  resources :users do
    resources :challenges, only: :index
  end

  get '/users/:user_id/accepted' => 'challenges#accepted', as: :accepted
  get '/users/:user_id/pending' => 'challenges#pending', as: :pending

  get '/all_challenges' => 'challenges#all'
end
