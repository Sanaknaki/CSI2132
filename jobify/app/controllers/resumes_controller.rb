# Resume controller
class ResumesController < ApplicationController
  layout 'index_layout'
  def create
    # TODO add it to the database
    
    uploaded_io = params[:resume_pdf]
    @student = Student.last
    ver = @student.resume.last ? @student.resume.last.id + 1 : 1
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

  def index
    @resumes = Resume.all
    render('index')
  end

  def upload
    @resume = Resume.create
    render('upload')
  end

  def new_version
    uploaded_io = params[:resume_pdf]
    @student = User.find_by_id(session[:user_id]).student
    ver = @student.resume.last ? @student.resume.last.id + 1 : 1
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

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def resume_params
    params.require.permit(:resume_pdf)
  end
end
