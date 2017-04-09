# student controller
class StudentsController < ApplicationController
  before_filter :authorize
  autocomplete :first_name, :last_name, :student_num
  def fetch_student_resumes
    @resumes = User.find_by_id(params[:id]).student.resume
    render 'my_resumes'
  end
end
