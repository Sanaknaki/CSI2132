# Resume controller
class ResumesController < ApplicationController
  layout 'index_layout'
  def create
    # TODO add it to the database
    @resume = Resume.create
    uploaded_io = params[:resume_pdf]
    File.open(Rails.root.join('public', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
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
