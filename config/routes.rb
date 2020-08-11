Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'users#home'

  get '/signin', to: 'sessions#new', as: :signin
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy", as: :signout

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
