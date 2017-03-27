Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'pages#home'
  get '/about' => 'pages#about'
  get '/tos' => 'pages#tos'
  get '/main' => 'pages#main'
end
