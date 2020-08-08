Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rides
  resources :attractions
  root "application#hello"
  resources :users


  get '/signin' => 'session#new'
  post '/signin' => 'session#signin'
  delete '/' => 'users#destroy'
  post '/rides' => 'rides#ride'
end
