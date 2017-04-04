# Resume controller
class ResumesController < ApplicationController
  layout 'index_layout'
  before_filter :authorize
  def create
    # TODO add it to the database
    
    uploaded_io = params[:resume_pdf]
    if session[:user_id]
      @student = User.find_by_id(session[:user_id]).student
    else
      @student = Student.last
    end
    ver = @student.resume.last ? @student.resume.last.version + 1 : 1
    ext = /\.[a-zA-Z]+/.match(uploaded_io.original_filename).to_s
    path = @student.student_num.to_s + '_' + ver.to_s + ext
    File.open(Rails.root.join('public', path), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @resume = @student.resume.create(
      :resume_path => path,
      :version => ver
    )
    @resume.save
    redirect_to '/'
  end

  def resume_review
    render 'find_student'
  end

  def find_student
    @student = Student.find_by_id(params[:student][:number])
    @resume = @student.resume
    render 'index'
  end

  def index
    @resumes = Resume.all
    render('index')
  end

  def upload
    render('upload')
  end

  def fetch_student_resume_by_id
    @resume = Resume.find(params[:rid])
    @comments = @resume.resume_comment
    render 'resume'
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def resume_params
    params.require.permit(:resume_pdf)
  end
end
