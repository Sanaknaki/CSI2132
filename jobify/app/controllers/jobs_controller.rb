# company controller
class JobsController < ApplicationController
  # TODO: Add company logo to db
  # TODO: fetch job for compaines
  before_filter :authorize
  def index
    @jobs = Job.all
    render('index')
  end

  def fetch_job_by_id
    @job = Job.find(params[:id])
    render('job_details')
  end

  def companies_jobs; end

  def fetch_jobs_for_company
    @jobs = Company.find_by_id(params[:c_id]).job
  end
end
