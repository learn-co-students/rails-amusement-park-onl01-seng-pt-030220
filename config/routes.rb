Rails.application.routes.draw do
  resources :rides
  resources :attractions
  root "application#hello"
  resources :users

  
  #get '/users/:id' => 'users#show'
  get '/signin' => 'session#new'
  post '/signin' => 'session#signin'
  delete '/' => 'users#destroy'
  post '/rides' => 'rides#ride'
end
