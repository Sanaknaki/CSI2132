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
  # Comment
  post '/companies/:id/comment' => 'comments#add_company_comment'
  post '/jobs/:id/comment' => 'comments#add_job_comment'
  post '/students/:id/resume/:rid/comment' => 'comments#add_resume_comment'
  # job
  get '/jobs' => 'jobs#index'
  get '/jobs/:id' => 'jobs#fetch_job_by_id', :as => :job
  post '/jobs/:id' => 'jobs#apply_to_job'
  # interviews
  # students
  # job and company
  get '/companies/:c_id/jobs' => 'jobs#fetch_jobs_for_company'
  # uploads
  get '/resume' => 'resumes#index'
  get '/resumes' => 'resumes#upload'
  post '/resumes' => 'resumes#create'
  # student resumes
  get '/student/:id/resumes/' => 'students#fetch_student_resumes'
  # get '/student/:id/resumes/:rid' => 'students#fetch_student_resume_by_id'
end
