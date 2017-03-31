Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Pages
  root 'pages#home'
  get '/', to: 'pages#home'
  get '/main' => 'pages#main'
  get '/tos' => 'pages#tos'
  get '/about' => 'pages#about'
  # Sessions
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # resource :sessions, only: [:new, :create, :destroy]
  # Users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # Company
  get '/companies' => 'companies#index'
  get '/companies/:id' => 'companies#fetch_company', :as => :company
  # uploads
  get '/resume' => 'resumes#index'
  get '/resumes' => 'resumes#upload'
  post '/resumes' => 'resumes#create'
  # student resumes
  # get '/student/:id/resumes' => 'students#fetch_student_resumes'
  # get '/student/:id/resumes/:rid' => 'students#fetch_student_resume_by_id'
end
