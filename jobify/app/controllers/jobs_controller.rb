# company controller
class JobsController < ApplicationController
  # TODO: Add company logo to db
  def index
    @jobs = Job.all
    render('index')
  end

  def fetch_job_by_id
    @job = Job.find(params[:id])
    render('job_details')
  end

  def companies_jobs; end
end
