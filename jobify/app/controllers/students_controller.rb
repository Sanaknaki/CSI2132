# student controller
class StudentsController < ApplicationController
  before_filter :authorize
  def fetch_student_resumes
    @resumes = User.find_by_id(params[:id]).student.resume
    render 'my_resumes'
  end
end
