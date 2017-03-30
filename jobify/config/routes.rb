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
  # job
  get '/jobs' => 'jobs#index'
  get '/jobs/:id' => 'jobs#fetch_job_by_id', :as => :job
  post '/jobs/:id' => 'jobs#apply_to_job'
  # interviews
  # students
  # job and company
  get '/companies/:c_id/jobs' => 'jobs#fetch_jobs_for_company'
end
