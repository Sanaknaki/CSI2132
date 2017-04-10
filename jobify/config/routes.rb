# Rails routes
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
  get '/companies/:c_id/jobs/:id' => 'jobs#fetch_jobs_for_company'
  # Comment
  post '/companies/:id/comment' => 'comments#add_company_comment'
  post '/students/:id/resume/:rid/comment' => 'comments#add_resume_comment'
  post '/companies/:c_id/jobs/:id' => 'comments#add_job_comment'
  # job
  get '/jobs' => 'jobs#index'
  get '/jobs/:id' => 'jobs#fetch_job_by_id', :as => :job
  post '/jobs/:id' => 'jobs#apply_to_job'
  # interviews
  # students
  # job and company
  get '/companies/:c_id/jobs' => 'jobs#fetch_jobs_for_company'
  # uploads
  get '/resumes' => 'resumes#upload'
  post '/resumes' => 'resumes#create'
  get '/review-resumes' => 'resumes#resume_review'
  post '/find-student' => 'resumes#find_student'
  get '/student/:id/resumes/:rid' => 'resumes#fetch_student_resume_by_id'
  post '/student/:id/resumes/:rid' => 'comments#add_resume_comment'
  # student resumes
  get '/student/:id/resumes/' => 'students#fetch_student_resumes'
  # rating
  post '/companies/:id/rating' => 'company_ratings#add_company_rating'
  resources :students do
    get :autocomplete_student_info, on: :collection
  end
end
