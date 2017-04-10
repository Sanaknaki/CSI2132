# student controller
class StudentsController < ApplicationController
  before_filter :authorize
  autocomplete :first_name, :last_name, :student_num

  def fetch_student_resumes
    raise ApplicationController::NotAuthorized if User.find_by_id(session[:user_id]).student
    @resumes = User.find_by_id(params[:id]).student.resume
    render 'my_resumes'
  end

  def fetch_my_resume
    @resumes = User.find_by_id(session[:user_id]).student.resume
    render 'my_resumes'
  end
end
