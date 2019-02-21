Rails.application.routes.draw do
  get 'sessions/new'

 root 'boards#index'
 get  '/signup',    to: 'users#new'
 post '/signup',    to: 'users#create'
 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'sessions#create'
 delete '/logout',  to: 'sessions#destroy'
 resources :boards
 resources :comments, only: [:create, :destroy]
 resources :users
end
