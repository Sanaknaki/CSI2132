Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'pages#home'
  get '/about' => 'pages#about'
  get '/tos' => 'pages#tos'
  get '/main' => 'pages#main'
  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # Users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
