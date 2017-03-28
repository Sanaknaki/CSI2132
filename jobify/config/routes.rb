Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Pages
  get '/', to: 'pages#home'
  get '/main' => 'pages#main'
  get '/tos' => 'pages#tos'
  get '/about' => 'pages#about'
  # Sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # Users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  # Company
  get '/companies' => 'companies#index'
end
