Rails.application.routes.draw do
  resources :users
  resources :attractions, only: [:index, :show, :create, :update, :edit, :new]
  get '/signin', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get '/logout', to: 'sesssions#destroy'
  delete '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'

   root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
