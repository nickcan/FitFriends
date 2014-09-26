Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'static#index'

  resources :users do
    resources :challenges
  end

  get "/home" => "home#index", as: :home
  get "/log_in" => "sessions#new"
  post "/log_in" => "sessions#create"
  get "/log_out" => "sessions#destroy", as: :log_out

  get 'challenges/search/:keyword', to: 'challenges#search'

  # Example of regular route:
  get 'users/:user_id/accepted' => 'challenges#accepted', as: :accepted
end
