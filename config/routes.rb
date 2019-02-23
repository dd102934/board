Rails.application.routes.draw do

 root 'static_pages#home' # => root_path  
 get 'static_pages/home'
 get 'static_pages/about'

 get '/about', to: 'static_pages#about'
 get 'sessions/new'

 get  '/signup',    to: 'users#new'
 post '/signup',    to: 'users#create'
 get    '/login',   to: 'sessions#new'
 post   '/login',   to: 'sessions#create'
 delete '/logout',  to: 'sessions#destroy'
 resources :boards
 resources :comments, only: [:create, :destroy]
 resources :users
end
