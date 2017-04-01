# Resume controller
class ResumesController < ApplicationController
  layout 'index_layout'
  def create
    # TODO add it to the database
    
    uploaded_io = params[:resume_pdf]
    File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    ver = @student.resumes.last.id + 1
    @resume = @student.resumes.create(
      :resume_path => path,
      :version => ver
    )
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

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def resume_params
    params.require.permit(:resume_pdf)
  end
end
