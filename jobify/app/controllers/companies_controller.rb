# company controller
class CompaniesController < ApplicationController
  layout "index_layout", only: [:index, :fetch_company, :main]
  before_filter :authorize
  # TODO: Add company logo to db
  def index
    @companies = Company.all
    @recently_added_companies = Company.order(created_at: :desc).limit(5)
    @top_five = Company.order(rating: :desc).limit(5)
    render('index')
  end

  def fetch_company
      @company = Company.find(params[:id])
      @job = Company.find(params[:id]).job
      @comments = @company.comment
      render('company_details')
    end
end
