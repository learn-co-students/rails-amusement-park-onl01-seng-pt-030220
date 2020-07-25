Rails.application.routes.draw do
  get '/signin', to: "sessions#new"
  post "/signin", to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  # post '/attractions/:id/ride', to: 'rides#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions
  resources :rides
  root "welcome#home"
end
