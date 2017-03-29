# company controller
class CompaniesController < ApplicationController
  # TODO: Add company logo to db
  def index
    @companies = Company.all
    render('index')
  end

  def fetch_company
    @company = Company.find(params[:id])
    render('company_details')
  end
end
